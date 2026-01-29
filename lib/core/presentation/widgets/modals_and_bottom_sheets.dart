import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/presentation/pages/phone_auth_screen.dart';
import 'package:aviapoint/core/data/database/app_db.dart';
import 'package:aviapoint/core/presentation/widgets/clear_progress.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/domain/entities/normal_check_list_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_sertificates_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/categories_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/categories_with_list_questions_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/detail_question_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/select_topics_screen.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/pages/type_sertificates_screen.dart';
import 'package:aviapoint/profile_page/profile/presentation/widget/profile_edit.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/on_the_way/presentation/widgets/pilot_reviews_bottom_sheet.dart' show UserReviewsBottomSheet;
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

/// Единая функция для показа экрана авторизации во всём приложении
/// Использует универсальный bottom sheet для единообразного отображения
Future<bool?> showLogin(BuildContext context, {GlobalKey<ScaffoldState>? scaffoldKey, final void Function()? callback}) async {
  final bool? result = await showUniversalBottomSheet<bool>(
    context: context,
    title: 'Авторизоваться',
    child: PhoneAuthScreen(callback: callback),
    onClose: () {
      // Navigator.of(context).pop();
      context.router.maybePop();
    },
  );
  if (result == true && callback != null) {
    callback.call();
  }
  return result;
}

Future<void> checkList({required BuildContext context, required List<NormalCheckListEntity> checkList}) async {
  return await showModalBottomSheet<void>(
    useRootNavigator: false,
    isDismissible: false,
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    barrierColor: AppColors.bgOverlay,
    backgroundColor: AppColors.background,
    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 24),
          child: Column(
            spacing: 24,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Карта контрольных проверок', textAlign: TextAlign.center, style: AppStyles.bigButtonCulture.copyWith(fontSize: 22)),
              Table(
                border: TableBorder.all(width: 0.5),
                children: [
                  ...checkList.map(
                    (e) => TableRow(
                      decoration: BoxDecoration(color: e.id.floor().isEven ? Colors.grey[200] : Colors.transparent),
                      children: [
                        Padding(padding: const EdgeInsets.all(6.0), child: Text(e.title)),
                        Padding(padding: const EdgeInsets.all(6.0), child: Text(e.doing)),
                      ],
                    ),
                  ),
                ],
              ),
              CustomButton(
                verticalPadding: 8,
                backgroundColor: Color(0xFF0A6EFA),
                title: 'Проверено',
                textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                borderColor: Color(0xFF0A6EFA),
                borderRadius: 46,
                boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                onPressed: () => context.router.maybePop(),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> selectTypeCertificate({required BuildContext context, required Enum screen}) async {
  final result = await showUniversalBottomSheet<TypeSertificatesEntity>(
    context: context,
    title: '',

    backgroundColor: AppColors.background,
    showCloseButton: false,
    useRootNavigator: true,
    child: TypeSertificatesScreen(title: 'Выберите тип свидетельства'),
  );
  if (result != null) {
    if (screen == Screens.learning) {
      BlocProvider.of<RosAviaTestCubit>(context).setTypeCertificate(result);

      BlocProvider.of<CategoriesWithListQuestionsBloc>(context).add(GetCategoriesWithListQuestionsEvent(typeSsertificatesId: result.id));
    }
    if (screen == Screens.selectTopicsScreen) {
      BlocProvider.of<RosAviaTestCubit>(context).setTypeCertificate(result);
      BlocProvider.of<CategoriesBloc>(context).add(GetCategoriesEvent(typeSsertificatesId: result.id));
    }
  }
}

Future<bool?> showDialogCustom({required BuildContext context}) async {
  final bool? result = await showDialog<bool>(
    context: context,
    // barrierColor: Color(0xFF1F2937),
    builder: (BuildContext context) {
      return Material(
        type: MaterialType.transparency,
        child: Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: ClearProgress(onTap1: () => Navigator.pop(context, true), onTap2: () => Navigator.pop(context, false)),
          ),
        ),
      );
    },
  );
  return result;

  // if (result != null) {}
}

Future<void> openQuestion({required BuildContext context, required QuestionWithAnswersEntity? question, required int questionId, required String? categoryTitle}) async {
  await showUniversalBottomSheet<void>(
    context: context,
    title: '',

    backgroundColor: AppColors.background,
    showCloseButton: false,
    useRootNavigator: true,
    child: DetailQuestionScreen(questionId: questionId, categoryTitle: categoryTitle, question: question, withClose: true),
  );
}

Future<void> selectTopics({required BuildContext context, TestMode? testMode}) async {
  try {
    _log('🔵 selectTopics вызван, context.mounted: ${context.mounted}');

    // Небольшая задержка для веб-платформы, чтобы предыдущий диалог успел закрыться
    if (kIsWeb) {
      _log('🔵 selectTopics: веб-платформа, ждем 200ms');
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }

    if (!context.mounted) {
      _log('⚠️ selectTopics: context не mounted после задержки');
      return;
    }

    _log('🔵 selectTopics: открываю showModalBottomSheet');

    final result = await showUniversalBottomSheet<(int certificateTypeId, bool mixAnswers, bool buttonHint, Set<int> selectedCategoryIds, String title, String image, bool mixQuestions)>(
      context: context,
      title: '',
      backgroundColor: const Color(0xFFF1F7FF),
      showCloseButton: false,
      useRootNavigator: true,
      child: SelectTopicsScreen(),
    );

    if (result != null) {
      // Очистить старые ответы и выбранные вопросы перед новым тестом
      await getIt<AppDb>().deleteAnswersByCertificateType(result.$1);
      await getIt<AppDb>().deleteSelectedQuestions(result.$1);

      await getIt<AppDb>().saveSettings(
        certificateTypeId: result.$1,
        mixAnswers: result.$2,
        buttonHint: result.$3,
        selectedCategoryIds: result.$4,
        title: result.$5,
        image: result.$6,
        mixQuestions: result.$7,
      );

      // Установить режим тестирования если он был передан
      if (testMode != null && context.mounted) {
        BlocProvider.of<RosAviaTestCubit>(context).setTestMode(testMode);
      }

      // Переходим на экран тестирования
      if (context.mounted) {
        context.router.push(TestByModeRoute(typeCertificateId: result.$1));
      }
    }
  } catch (e, stackTrace) {
    // Обработка ошибок
    _log('❌ Ошибка в selectTopics: $e');
    _log('StackTrace: $stackTrace');
  }
}

// Вспомогательная функция для логирования (работает и в production)
void _log(String message) {
  if (kDebugMode) {
    print(message);
  }
}

/// Новая логика: проверить есть ли активный тест и показать соответствующий диалог
Future<void> startTestingFlowNew({required BuildContext context}) async {
  try {
    final rosAviaTestCubit = context.read<RosAviaTestCubit>();
    final certificateTypeId = rosAviaTestCubit.state.typeSertificate.id;
    final db = getIt<AppDb>();

    // Проверяем есть ли активный тест (ответы в БД)
    bool hasActive = false;
    try {
      hasActive = await db.hasActiveTest(certificateTypeId);
    } catch (e) {
      // Если ошибка при проверке БД, считаем что нет активного теста
      if (kDebugMode) {
        print('Ошибка при проверке активного теста: $e');
      }
      hasActive = false;
    }

    if (!context.mounted) return;

    if (hasActive) {
      // Есть активный тест - показываем диалог продолжения
      final certificateSettings = await db.getSettingsForCertificate(certificateTypeId: certificateTypeId);
      final unansweredCount = await db.getUnansweredQuestionsCount(certificateTypeId);

      if (!context.mounted) return;

      // Если нет неотвеченных вопросов - значит тест завершен, не показываем модалку
      if (unansweredCount == 0) {
        if (context.mounted) {
          testingModeDialog(context: context);
        }
      } else {
        // Есть неотвеченные вопросы - показываем диалог продолжения
        final testModeName = certificateSettings?.testMode == 'training' ? 'тренировочном режиме' : 'стандартном тесте';

        if (!context.mounted) return;

        await showDialog<void>(
          context: context,
          barrierDismissible: true,
          useRootNavigator: true,
          builder: (dialogContext) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: AlertDialog(
              icon: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  AutoRouter.of(context).maybePop();
                },
                child: Align(alignment: Alignment.topRight, child: SvgPicture.asset(Pictures.closeAuth)),
              ),
              iconPadding: EdgeInsets.all(8),
              backgroundColor: Colors.white,
              title: Text(
                'У вас есть незаконченный тест!',
                style: AppStyles.bold14s.copyWith(color: Color(0xFF223B76)),
                textAlign: TextAlign.center,
              ),
              content: Text(
                'В $testModeName у вас осталось $unansweredCount вопросов. Хотите продолжить?',
                style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767)),
                textAlign: TextAlign.center,
              ),
              actions: [
                CustomButton(
                  verticalPadding: 4,
                  backgroundColor: Color(0xFF0A6EFA),
                  title: 'Продолжить',
                  textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                  borderColor: Color(0xFF0A6EFA),
                  borderRadius: 46,
                  boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                  onPressed: () {
                    Navigator.pop(dialogContext);
                    // Продолжить тест
                    context.router.push(TestByModeRoute(typeCertificateId: certificateTypeId));
                  },
                ),
                SizedBox(height: 16),
                CustomButton(
                  verticalPadding: 4,
                  backgroundColor: Colors.white,
                  title: 'Начать сначала',
                  textStyle: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA)),
                  borderColor: Color(0xFF0A6EFA),
                  borderRadius: 46,
                  boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.25), blurRadius: 4, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                  onPressed: () async {
                    Navigator.pop(dialogContext);
                    // Очистить ответы и начать заново
                    await db.deleteAnswersByCertificateType(certificateTypeId);
                    await db.deleteSelectedQuestions(certificateTypeId);
                    if (context.mounted) {
                      testingModeDialog(context: context);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }
    } else {
      // Нет активного теста - показываем выбор режима
      if (context.mounted) {
        testingModeDialog(context: context);
      }
    }
  } catch (e, stackTrace) {
    // Обработка ошибок
    if (kDebugMode) {
      print('Ошибка в startTestingFlowNew: $e');
      print('StackTrace: $stackTrace');
    }
    // В случае ошибки все равно пытаемся показать диалог выбора режима
    if (context.mounted) {
      try {
        testingModeDialog(context: context);
      } catch (e2) {
        if (kDebugMode) {
          print('Ошибка при показе testingModeDialog: $e2');
        }
      }
    }
  }
}

// Экран выбора режима тестирования
Future<void> testingModeDialog({required BuildContext context}) async {
  try {
    if (!context.mounted) {
      _log('⚠️ testingModeDialog: context не mounted');
      return;
    }

    _log('🔵 testingModeDialog: открываю экран выбора режима');

    // Просто открываем экран, вся логика теперь в TestingModeScreen
    await context.router.push(
      BaseRoute(
        children: [
          LearningNavigationRoute(children: [TestingModeRoute()]),
        ],
      ),
    );

    _log('🔵 testingModeDialog: экран закрыт');
  } catch (e, stackTrace) {
    // Обработка ошибок
    _log('❌ Ошибка в testingModeDialog: $e');
    _log('StackTrace: $stackTrace');
  }
}

/// Проверяет, заполнены ли все поля профиля пользователя
///
/// Проверяются следующие поля:
/// - firstName (имя)
/// - lastName (фамилия)
/// - email
/// - telegram
/// - max
///
/// [context] - контекст для доступа к Bloc
///
/// Возвращает:
/// - `true` если все поля заполнены
/// - `false` если хотя бы одно поле пустое
/// - `null` если профиль еще не загружен
bool? checkProfileDataComplete(BuildContext context) {
  try {
    final profileBloc = context.read<ProfileBloc>();
    final profileState = profileBloc.state;

    return profileState.maybeWhen(
      success: (profile) {
        // Проверяем все поля профиля
        final firstName = profile.firstName?.trim() ?? '';
        final lastName = profile.lastName?.trim() ?? '';
        final email = profile.email?.trim() ?? '';
        final telegram = profile.telegram?.trim() ?? '';
        final max = profile.max?.trim() ?? '';

        // Возвращаем false, если хотя бы одно поле пустое
        if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || telegram.isEmpty || max.isEmpty) {
          return false;
        }
        return true;
      },
      orElse: () {
        // Если профиль не загружен, загружаем его
        // Возвращаем null, чтобы вызывающий код знал, что нужно проверить через BlocListener
        profileBloc.add(const ProfileEvent.get());
        return null;
      },
    );
  } catch (e) {
    // Игнорируем ошибки при проверке профиля
    print('Ошибка при проверке профиля: $e');
    return true; // В случае ошибки считаем, что проверка прошла успешно
  }
}

/// Универсальная функция для проверки полей профиля и открытия модалки редактирования
///
/// Проверяет, заполнены ли все поля профиля пользователя.
/// Если хотя бы одно поле пустое, открывает форму редактирования профиля с указанным сообщением.
///
/// [context] - контекст для доступа к Bloc и навигации
/// [message] - сообщение, которое будет показано, если поля не заполнены (опционально)
///
/// Возвращает:
/// - `true` если все поля заполнены
/// - `false` если хотя бы одно поле пустое (в этом случае открывается форма редактирования)
/// - `null` если профиль еще не загружен (нужно проверить через BlocListener)
bool? checkDataProfileAndOpenEditIfNeeded({required BuildContext context, String? message}) {
  try {
    final profileBloc = context.read<ProfileBloc>();
    final profileState = profileBloc.state;

    return profileState.maybeWhen(
      success: (profile) {
        // Проверяем все поля профиля
        final firstName = profile.firstName?.trim() ?? '';
        final lastName = profile.lastName?.trim() ?? '';
        final email = profile.email?.trim() ?? '';
        final telegram = profile.telegram?.trim() ?? '';
        final max = profile.max?.trim() ?? '';

        // Если хотя бы одно поле пустое, открываем форму редактирования
        if (firstName.isEmpty || lastName.isEmpty || email.isEmpty || telegram.isEmpty || max.isEmpty) {
          // Используем Future.delayed вместо addPostFrameCallback, чтобы избежать конфликтов
          // во время навигации или рендеринга других страниц
          Future.delayed(const Duration(milliseconds: 600), () {
            try {
              // ВАЖНО: после создания полёта экран может уже закрыться (context станет unmounted),
              // поэтому открываем bottom sheet через root navigator context.
              final rootContext = navigatorKey.currentContext ?? Navigator.of(context, rootNavigator: true).context;
              if (!rootContext.mounted) return;

              openProfileEdit(context: rootContext);
              ScaffoldMessenger.of(rootContext).showSnackBar(
                SnackBar(
                  content: Text(message ?? 'Заполните профиль чтоб с вами могли связаться'),
                  backgroundColor: Colors.orange,
                  duration: Duration(seconds: 5),
                ),
              );
            } catch (e) {
              debugPrint('Ошибка при открытии профиля: $e');
            }
          });
          return false;
        }
        return true;
      },
      orElse: () {
        // Если профиль не загружен, загружаем его
        // Возвращаем null, чтобы вызывающий код знал, что нужно проверить через BlocListener
        profileBloc.add(const ProfileEvent.get());
        return null;
      },
    );
  } catch (e) {
    // Игнорируем ошибки при проверке профиля
    print('Ошибка при проверке профиля: $e');
    return true; // В случае ошибки считаем, что проверка прошла успешно
  }
}

Future<void> openProfileEdit({required BuildContext context}) async {
  try {
    // Проверяем, что контекст валиден перед открытием
    if (!context.mounted) {
      debugPrint('❌ [openProfileEdit] Контекст не валиден');
      return;
    }

    // Используем небольшую задержку, чтобы убедиться, что UI готов
    await Future<void>.delayed(const Duration(milliseconds: 100));
    
    if (!context.mounted) {
      debugPrint('❌ [openProfileEdit] Контекст не валиден после задержки');
      return;
    }

    await showUniversalBottomSheet<void>(
      context: context,
      title: '',
      backgroundColor: AppColors.background,
      showCloseButton: false,
      useRootNavigator: true,
      isDismissible: true,
      enableDrag: true,
      child: ProfileEdit(),
    ).then((_) {
      // После закрытия bottom sheet обновляем профиль, чтобы получить актуальное фото
      if (context.mounted) {
        try {
          final profileBloc = context.read<ProfileBloc>();
          profileBloc.add(ProfileEvent.get());
        } catch (e) {
          debugPrint('❌ [openProfileEdit] Ошибка при обновлении профиля: $e');
        }
      }
    });
  } catch (e, stackTrace) {
    debugPrint('❌ [openProfileEdit] Ошибка при открытии bottom sheet: $e');
    debugPrint('❌ [openProfileEdit] Stack trace: $stackTrace');
    // Показываем сообщение об ошибке пользователю
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Не удалось открыть форму редактирования профиля'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}

Future<void> openContactUs({required BuildContext context}) async {
  await showUniversalBottomSheet<void>(
    context: context,
    title: 'Связаться с нами',
    height: MediaQuery.of(context).size.height * 0.9,
    backgroundColor: AppColors.background,
    useRootNavigator: true,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Кнопки Telegram и WhatsApp
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () async {
                  // Формат: https://wa.me/79990697289 (без +)
                  final uri = Uri.parse('https://wa.me/79990697289');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                    Navigator.of(context).pop();
                  } else {
                    // Если не удалось открыть, показываем сообщение
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось открыть WhatsApp'), duration: Duration(seconds: 2)));
                    }
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Color(0xFFD5FDD8), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Pictures.whatsapp),
                      SizedBox(width: 6),
                      Text('Whatsapp', style: AppStyles.bold16s.copyWith(color: Color(0xFF01B40E))),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Flexible(
              child: GestureDetector(
                onTap: () async {
                  final uri = Uri.parse('https://t.me/dartflutterworld');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                    Navigator.of(context).pop();
                  } else {
                    // Если не удалось открыть, показываем сообщение
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось открыть Telegram'), duration: Duration(seconds: 2)));
                    }
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Color(0xFFD0F2FF), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Pictures.telegramm),
                      SizedBox(width: 6),
                      Text('Telegram', style: AppStyles.bold16s.copyWith(color: Color(0xFF008EC3))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Future<void> openPilotReviews({required BuildContext context, required int pilotId}) async {
  await showUniversalBottomSheet<void>(
    context: context,
    title: 'Отзывы о пилоте',
    backgroundColor: AppColors.background,
    showCloseButton: true,
    useRootNavigator: true,
    child: UserReviewsBottomSheet(userId: pilotId, title: 'Отзывы о пилоте'),
  );
}
