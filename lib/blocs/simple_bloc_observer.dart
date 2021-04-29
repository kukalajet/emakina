import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase base, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(base, error, stackTrace);
  }

  @override
  void onChange(BlocBase base, Change change) {
    print(change);
    super.onChange(base, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }
}
