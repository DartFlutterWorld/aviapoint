import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@sealed
class AppBlocObserver extends BlocObserver {
  // ignore: avoid-global-state
  static AppBlocObserver? _instance;

  factory AppBlocObserver.instance() => _instance ??= AppBlocObserver._();
  AppBlocObserver._();

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    // logger.e('AppBlocObserver', error, stackTrace);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('${bloc.runtimeType} $change');
    // log('${bloc.runtimeType}');
  }
}
