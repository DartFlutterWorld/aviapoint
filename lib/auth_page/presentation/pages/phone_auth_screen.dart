import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/auth_page/presentation/bloc/sms_bloc.dart';
import 'package:aviapoint/auth_page/presentation/widgets/phone_form_field.dart';
import 'package:aviapoint/auth_page/presentation/widgets/pin_themes.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key, this.callback}) : super(key: key);
  final void Function()? callback;

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  String phone = '';
  String code = '';
  late final FocusNode _focusNode;

  void handleChangePhone(String value) {
    BlocProvider.of<SmsBloc>(context).add(InitialSmsEvent());
    BlocProvider.of<AuthBloc>(context).add(const InitialAuthEvent());
    setState(() {
      phone = value;
    });
  }

  void _authBlocListener(_, AuthState state) async {
    if (state is SuccessAuthState) {
      await AutoRouter.of(context).maybePop(true);
    }
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    if (!kIsWeb) {
      _focusNode.requestFocus();
    }
    BlocProvider.of<SmsBloc>(context).add(InitialSmsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var app = BlocListener<AuthBloc, AuthState>(
      listener: _authBlocListener,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF3EBFF),
                  Color(0xFFFFFAF1),
                ],
              ),
            ),
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 0,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    BlocProvider.of<SmsBloc>(context).add(InitialSmsEvent());
                    BlocProvider.of<AuthBloc>(context).add(const InitialAuthEvent());
                    AutoRouter.of(context).maybePop();
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      width: 120,
                      child: Text(
                        'Отмена',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          height: 13.92 / 12,
                          color: AppColors.textSeconds,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Вход или регистрация',
                  style: AppStyles.button.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                // const SizedBox(height: 30),
                PhoneFormField(
                  onChange: handleChangePhone,
                ),
                BlocBuilder<SmsBloc, SmsState>(
                  builder: (context, state) {
                    if (state is LoadingSmsState) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 89, bottom: 90),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    if (state is InitialSmsState) {
                      return Column(
                        children: [
                          SizedBox(height: 155),
                          SizedBox(
                            height: 78,
                            child: Center(
                              child: CustomButton(
                                title: 'Получить смс код',
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.sp,
                                    height: 1,
                                    color: (phone.isEmpty || phone.length < 15 ? true : false) ? AppColors.mainSolid.withOpacity(0.5) : AppColors.mainSolid),
                                borderColor: Colors.black12,
                                onPressed: (phone.isEmpty || phone.length < 15 ? true : false)
                                    ? null
                                    : () {
                                        BlocProvider.of<SmsBloc>(context).add(
                                          GetSmsEvent(
                                            phone: ('+7$phone').replaceAll(r'-', '').replaceAll(r'(', '').replaceAll(r')', '').replaceAll(r'(', '').replaceAll(r' ', ''),
                                          ),
                                        );
                                      },
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFFCFBAE2),
                                    blurRadius: 5.0,
                                    offset: Offset(
                                      0.0,
                                      4.0,
                                    ),
                                  ),
                                ],
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is SuccessSmsState) {
                      return Column(
                        children: [
                          SizedBox(height: 16),
                          Text(
                            'На ваш номер телефона отправлен смс код, введите его',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          Pinput(
                            focusNode: _focusNode,
                            enabled: state is! LoadingSmsState,
                            //autofocus: true,
                            defaultPinTheme: defaultPinTheme,
                            disabledPinTheme: disabledPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: focusedPinTheme,
                            validator: (s) {
                              return null;
                            },
                            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            onCompleted: (pin) {
                              setState(() {
                                code = pin;
                              });
                            },
                            onChanged: (value) {
                              BlocProvider.of<AuthBloc>(context).add(const InitialAuthEvent());

                              setState(() {
                                code = '';
                              });
                            },

                            // smsRetriever: smsRetrieverImpl,
                          ),
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              if (state is ErrorAuthState) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Text(
                                    state.errorForUser,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                );
                              }
                              return SizedBox();
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 20),
                            height: 78,
                            child: Center(
                              child: CustomButton(
                                title: 'Отправить',
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.sp,
                                  height: 1,
                                  color: (phone.isEmpty || phone.length < 15 ? true : false || code.length != 4) ? AppColors.mainSolid.withOpacity(0.5) : AppColors.mainSolid,
                                ),
                                borderColor: Colors.black12,
                                onPressed: (phone.isEmpty || phone.length < 15 ? true : false || code.length != 4)
                                    ? null
                                    : () {
                                        BlocProvider.of<AuthBloc>(context).add(
                                          GetAuthEvent(
                                            phone: ('+7$phone').replaceAll(r'-', '').replaceAll(r'(', '').replaceAll(r')', '').replaceAll(r'(', '').replaceAll(r' ', ''),
                                            sms: code,
                                          ),
                                        );
                                        print('$phone: $code');
                                      },
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFFCFBAE2),
                                    blurRadius: 5.0,
                                    offset: Offset(
                                      0.0,
                                      4.0,
                                    ),
                                  ),
                                ],
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is ErrorSmsState) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Column(
                          children: [
                            Text(state.errorForUser),
                          ],
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Material(child: app);
  }
}
