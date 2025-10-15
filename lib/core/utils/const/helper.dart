import 'dart:convert';

import 'package:aviapoint/auth_page/data/tokens/token_storage.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/auth_page/presentation/pages/phone_auth_screen.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

String bigFirstSymbol(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
}

Future<void> showLogin(BuildContext context, {GlobalKey<ScaffoldState>? scaffoldKey, final void Function()? callback}) async {
  final bool? result = await showCupertinoModalBottomSheet<bool>(
    barrierColor: Colors.black12,
    topRadius: const Radius.circular(20),
    context: context,
    builder: (context) => PhoneAuthScreen(callback: callback),
  );
  if (result == true) {
    if (callback != null) {
      callback.call();
    }
  }
}

void logOut(BuildContext context) async {
  final apiDatasource = getIt.get<ApiDatasource>();
  apiDatasource.delAuthHeader();

  BlocProvider.of<AuthBloc>(context).add(InitialAuthEvent());
  BlocProvider.of<ProfileBloc>(context).add(InitialProfileEvent());
  await TokenStorage.clearTokens();
  Provider.of<AppState>(context, listen: false).checkAuthStatus();
}

(Color, Color) getColors(int id) {
  switch (id) {
    case 1:
      return (Color(0xFFD8F9EC), Color(0xFF15D585));
    case 2:
      return (Color(0xFFE8E8E8), Color(0xFF9A9A9A));
    case 3:
      return (Color(0xFFF7EBD3), Color(0xFFF49B3D));
    case 4:
      return (Color(0xFFFFE0E0), Color(0xFFFF6B6B));
    case 5:
      return (Color(0xFFE8DAFF), Color(0xFF8258F5));
    default:
      return (Colors.lime, Colors.black);
  }
}

final emptyQuestion = QuestionWithAnswersEntity(answers: List.empty(), questionId: 0, questionText: '');

enum TestMode { training, standart }

enum Screens {
  learning, // обучение
  selectTopicsScreen, // Выбор сертификата и тем в боттом шите тестирования
}

class IntListJson extends TypeConverter<Set<int>, String> {
  const IntListJson();
  @override
  Set<int> fromSql(String fromDb) {
    if (fromDb.isEmpty) return const {};
    final raw = jsonDecode(fromDb);
    return (raw as List).map((e) => (e as num).toInt()).toSet();
  }

  @override
  String toSql(Set<int> value) => jsonEncode(value.toList());
}
