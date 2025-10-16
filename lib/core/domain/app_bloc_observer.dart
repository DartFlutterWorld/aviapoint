import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:aviapoint/core/utils/talker_config.dart';

@sealed
class AppBlocObserver extends BlocObserver {
  // ignore: avoid-global-state
  static AppBlocObserver? _instance;

  factory AppBlocObserver.instance() => _instance ??= AppBlocObserver._();
  AppBlocObserver._();

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    AppTalker.debug('BLoC Created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    AppTalker.debug('BLoC Event: ${bloc.runtimeType} - $event');
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    AppTalker.debug('BLoC Transition: ${bloc.runtimeType} - ${transition.event} -> ${transition.nextState}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    AppTalker.error('BLoC Error: ${bloc.runtimeType}', error, stackTrace);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    AppTalker.verbose('BLoC Change: ${bloc.runtimeType} - ${change.currentState} -> ${change.nextState}');
  }
}
