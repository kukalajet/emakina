import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pedantic/pedantic.dart';
import 'package:auth_repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    @required AuthRepository authRepository,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        super(const AuthState.unknown()) {
    _userSubscription = _authRepository.user.listen((user) {
      add(AuthUserChanged(user));
    });
  }

  final AuthRepository _authRepository;
  StreamSubscription<User> _userSubscription;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthUserChanged) {
      yield _mapAuthenticationUserChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      unawaited(_authRepository.logOut());
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  AuthState _mapAuthenticationUserChangedToState(
    AuthUserChanged event,
  ) {
    return event.user != User.empty
        ? AuthState.authenticated(event.user)
        : const AuthState.unauthenticated();
  }
}
