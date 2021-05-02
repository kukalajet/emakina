import 'dart:async';
import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

/// Thrown if during the sign up process if a failure occurs.
class SignUpFailure implements Exception {}

/// Thrown during the login process if a failure occurs.
class LogInWithEmailAndPasswordFailure implements Exception {}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure implements Exception {}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}

/// Thrown during the login process if wrong credentials are used.
class LogInWithWrongCredentials implements Exception {}

/// Thrown during the login process if wrong credentials are used.
class SignUpWithWrongCredentials implements Exception {}

/// Thrown if stored token is `null`
class TokenFailure implements Exception {}

/// Thrown during the retrieving of current user from server
/// if a failure occurs.
class SelfUserFailure implements Exception {}

/// {@template auth_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthRepository {
  /// {@macro auth_repository}
  AuthRepository({
    GoogleSignIn googleSignIn,
    @required this.httpClient,
    @required this.storage,
  })  : _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _controller = StreamController<User>() {
    setupStorage();
    sendUser();
  }

  final GoogleSignIn _googleSignIn;
  final StreamController<User> _controller;
  final http.Client httpClient;
  final FlutterSecureStorage storage;

  /// Authentication service's constants
  static const String _baseUrl = 'http://192.168.1.12:3000/';
  static const String _authUrl = '${_baseUrl}auth/';
  static const String _usersUrl = '${_baseUrl}users/';
  static const String _signinEndpoint = 'signin';
  static const String _signupEndpoint = 'signup';
  // TODO: Remove this, extract user object from token.
  static const String _selfEndpoint = 'self';

  /// Storage constants
  static const String _userKey = 'USER';
  static const String _tokenKey = 'TOKEN';
  static const String _firstRunKey = 'FIRST_RUN';

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    return _controller.stream.map((user) {
      return user == null ? User.empty : user;
    });
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _googleSignIn.signOut(),
      ]);
    } on Exception {
      throw LogOutFailure();
    }
  }

  void sendUser() async {
    await setupStorage();
    final user = await retrieveUser();
    if (user == null) return _controller.add(User.empty);
    _controller.add(user);
  }

  Future<void> setupStorage() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_firstRunKey) ?? true) {
      await storage.deleteAll();
    }

    await prefs.setBool(_firstRunKey, false);
  }

  /// {start} API calls
  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpFailure] if an exception occurs.
  Future<void> signUp({
    @required String email,
    @required String password,
    @required String firstName,
    @required String lastName,
  }) async {
    assert(email != null &&
        password != null &&
        firstName != null &&
        lastName != null);

    try {
      final response = await httpClient.post(
        Uri.parse('$_authUrl$_signupEndpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
        }),
      );
      final statusCode = response.statusCode;
      if (statusCode != 201) throw SignUpWithWrongCredentials();

      await logInWithEmailAndPassword(email: email, password: password);
    } on Exception {
      throw SignUpFailure();
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      await googleUser.authentication.then((key) async {
        final url = 'https://auto24.herokuapp.com/auth/signinwithgoogle';
        final headers = <String, String>{'Content-type': 'application/json'};
        final data = <String, String>{
          'idToken': key.idToken,
          'googleId': _googleSignIn.currentUser.id,
          'email': _googleSignIn.currentUser.email,
          'photoUrl': _googleSignIn.currentUser.photoUrl,
          'name': _googleSignIn.currentUser.displayName,
        };

        final response = await httpClient.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(data),
        );
        final status = response.statusCode;
        final dynamic body = jsonDecode(response.body);
        if (status == 201) {
          final dynamic accessToken = body['accessToken'];
          // final user = User(
          //   name: _googleSignIn.currentUser.displayName,
          //   email: _googleSignIn.currentUser.email,
          //   photo: _googleSignIn.currentUser.photoUrl,
          //   id: key.idToken,
          // );

          // _controller.add(user);

          final stringifiedUser = user.toString();
          await storage.write(key: 'accessToken', value: accessToken as String);
          await storage.write(key: _userKey, value: stringifiedUser);
        } else {
          throw LogInWithGoogleFailure();
        }
      });
    } on Exception {
      throw LogInWithGoogleFailure();
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);
    try {
      final response = await httpClient.post(
        Uri.parse('$_authUrl$_signinEndpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      final body = jsonDecode(response.body) as Map<String, dynamic>;

      final statusCode = response.statusCode;
      if (statusCode != 201) throw LogInWithWrongCredentials();

      final token = body['accessToken'] as String;
      if (token == null) throw LogInWithEmailAndPasswordFailure();

      await storeToken(token);

      // ignore: todo
      // TODO: Reconsider moving the following logic out of here.
      final user = await getSelf();
      _controller.add(user);
      // } on Exception {
      //   throw LogInWithEmailAndPasswordFailure();
      // }
    } catch (error) {
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  // TODO: Replace `getSelf` with a method which retrieves
  Future<User> getSelf() async {
    final token = await retrieveToken();
    if (token == null) throw TokenFailure();
    try {
      final response = await httpClient.get(
        Uri.parse('$_usersUrl$_selfEndpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final user = User.fromJson(jsonDecode(response.body));
        await storeUser(user);

        return user;
      } else {
        throw Exception('Failed to load album');
      }
    } on Exception {
      throw SelfUserFailure();
    }
  }

  /// {end} API calls

  /// Storage interface methods

  // WIP
  Future<void> storeToken(String token) async {
    await storage.write(key: _tokenKey, value: token);
  }

  // WIP
  Future<void> storeUser(User user) async {
    await storage.write(key: _userKey, value: user.toString());
  }

  // WIP
  Future<String> retrieveToken() async {
    return storage.read(key: _tokenKey);
  }

  // WIP
  Future<User> retrieveUser() async {
    final user = await storage.read(key: _userKey);
    if (user == null) return null;
    return User.fromJson(jsonDecode(user));
  }

  // WIP
  Future<void> deleteStorage() async {
    await storage.deleteAll();
  }
}
