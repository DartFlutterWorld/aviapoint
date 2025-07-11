import 'package:aviapoint/auth_page/data/tokens/token_storage.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/auth_page/presentation/pages/phone_auth_screen.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/presentation/proveider/app_state.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

String capitalizeSentence(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
}

Future<void> showLogin(
  BuildContext context, {
  GlobalKey<ScaffoldState>? scaffoldKey,
  final void Function()? callback,
}) async {
  final bool? result = await showCupertinoModalBottomSheet<bool>(
    barrierColor: Colors.black12,
    topRadius: const Radius.circular(20),
    context: context,
    builder: (context) => PhoneAuthScreen(
      callback: callback,
    ),
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
