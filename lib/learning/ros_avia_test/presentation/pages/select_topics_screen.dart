import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/data/database/app_db.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/categories_with_list_questions_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/checkbox_with_title.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/select_topics_test_widget.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/select_topics_warning_dialog.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/your_specialization_widget.dart';
import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';
import 'package:aviapoint/payment/utils/payment_helper.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

typedef SettingsTest = ({bool mixAnswers, bool mixQuestions, bool buttonHint});

class SelectTopicsScreen extends StatefulWidget {
  final bool? hasActiveSubscription; // Опциональный параметр для передачи статуса подписки извне

  const SelectTopicsScreen({super.key, this.hasActiveSubscription});

  @override
  State<SelectTopicsScreen> createState() => _SelectTopicsScreenState();
}

class _SelectTopicsScreenState extends State<SelectTopicsScreen> {
  final ValueNotifier<Set<int>> selectedCategoryId = ValueNotifier<Set<int>>({});
  final ValueNotifier<int> categoriesLenght = ValueNotifier<int>(0);
  final ValueNotifier<SettingsTest> settingsTest = ValueNotifier<SettingsTest>((mixAnswers: false, mixQuestions: false, buttonHint: false));
  late int _lastCertificateTypeId;
  bool _hasActiveSubscription = false;

  @override
  void initState() {
    super.initState();
    _lastCertificateTypeId = BlocProvider.of<RosAviaTestCubit>(context).state.typeSertificate.id;
    BlocProvider.of<CategoriesWithListQuestionsBloc>(context).add(GetCategoriesWithListQuestionsEvent(typeSsertificatesId: _lastCertificateTypeId));

    // Если статус подписки передан извне, используем его, иначе делаем запрос
    if (widget.hasActiveSubscription != null) {
      _hasActiveSubscription = widget.hasActiveSubscription!;
      // Если подписки нет, сбрасываем настройки
      if (!_hasActiveSubscription) {
        settingsTest.value = (mixAnswers: false, mixQuestions: false, buttonHint: false);
      }
    } else {
      // Статус не передан - делаем запрос (для обратной совместимости)
      _checkSubscription();
    }
  }

  // УБРАНО: didChangeDependencies вызывается слишком часто и создает лишние запросы
  // Если нужно проверить подписку после возврата (например, после оплаты),
  // это можно сделать явно через метод или при открытии bottom sheet
  /*
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Проверяем подписку при возврате на экран (например, после оплаты)
    _checkSubscription();
  }
  */

  Future<void> _checkSubscription() async {
    try {
      final appState = Provider.of<AppState>(context, listen: false);
      if (!appState.isAuthenticated) {
        if (mounted) {
          setState(() {
            _hasActiveSubscription = false;
          });
        }
        return;
      }

      final paymentRepository = getIt<PaymentRepository>();
      final subscriptions = await paymentRepository.getSubscriptionStatus();

      if (!mounted) return;

      final hasActive = subscriptions.any((subscription) => subscription.isActive && subscription.endDate.isAfter(DateTime.now()));

      if (mounted) {
        setState(() {
          _hasActiveSubscription = hasActive;
        });
        // Если подписка изменилась на false, сбрасываем настройки
        if (!hasActive) {
          settingsTest.value = (mixAnswers: false, mixQuestions: false, buttonHint: false);
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasActiveSubscription = false;
        });
        // Если ошибка при проверке подписки, сбрасываем настройки
        settingsTest.value = (mixAnswers: false, mixQuestions: false, buttonHint: false);
      }
    }
  }

  Future<void> _navigateToPayment(BuildContext context) async {
    print('🔵 [SelectTopicsScreen] _navigateToPayment вызван');
    try {
      if (!context.mounted) {
        print('❌ [SelectTopicsScreen] Context not mounted');
        return;
      }

      // Закрываем bottom sheet перед открытием оплаты
      print('🔵 [SelectTopicsScreen] Закрываю bottom sheet перед открытием оплаты');
      Navigator.of(context).pop();
      
      // Небольшая задержка для закрытия bottom sheet
      await Future<void>.delayed(const Duration(milliseconds: 300));

      // Проверяем статус авторизации
      final appState = Provider.of<AppState>(context, listen: false);
      final isAuthenticated = appState.isAuthenticated;

      if (!isAuthenticated) {
        print('🔵 [SelectTopicsScreen] Пользователь не авторизован, показываю экран авторизации');

        // Небольшая задержка для закрытия bottom sheet
        await Future<void>.delayed(const Duration(milliseconds: 300));

        // Получаем root context для навигации
        final rootContext = navigatorKey.currentContext;
        if (rootContext == null || !rootContext.mounted) {
          print('❌ [SelectTopicsScreen] rootContext не доступен');
          return;
        }

        // Показываем экран авторизации
        final loginResult = await showLogin(
          rootContext,
          callback: () {
            print('🔵 [SelectTopicsScreen] Callback от showLogin вызван');
            // Используем addPostFrameCallback для вызова после обновления UI
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              // Небольшая задержка для обновления статуса авторизации
              await Future<void>.delayed(const Duration(milliseconds: 500));

              // Получаем актуальный root context после авторизации
              final updatedRootContext = navigatorKey.currentContext;
              if (updatedRootContext != null && updatedRootContext.mounted) {
                print('🔵 [SelectTopicsScreen] Открываю экран оплаты после авторизации');
                await _openPaymentScreen(updatedRootContext);
              } else {
                print('❌ [SelectTopicsScreen] rootContext не доступен после авторизации');
              }
            });
          },
        );

        // Если авторизация прошла успешно, но callback не вызвался, пробуем открыть оплату
        if (loginResult == true) {
          print('🔵 [SelectTopicsScreen] Авторизация успешна (result=true), открываю оплату');
          // Используем addPostFrameCallback для вызова после обновления UI
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            // Небольшая задержка для обновления статуса авторизации
            await Future<void>.delayed(const Duration(milliseconds: 800));

            final updatedRootContext = navigatorKey.currentContext;
            if (updatedRootContext != null && updatedRootContext.mounted) {
              print('🔵 [SelectTopicsScreen] Открываю экран оплаты после авторизации (fallback)');
              await _openPaymentScreen(updatedRootContext);
            } else {
              print('❌ [SelectTopicsScreen] rootContext не доступен после авторизации (fallback)');
            }
          });
        }
        return;
      }

      // Если авторизован - открываем экран оплаты
      // Получаем root context для навигации после закрытия bottom sheet
      final rootContext = navigatorKey.currentContext;
      if (rootContext != null && rootContext.mounted) {
        await _openPaymentScreen(rootContext);
      } else {
        print('❌ [SelectTopicsScreen] rootContext не доступен после закрытия bottom sheet');
      }
    } catch (e, stackTrace) {
      print('❌ [SelectTopicsScreen] Ошибка: $e');
      print('❌ [SelectTopicsScreen] StackTrace: $stackTrace');
      final rootContext = navigatorKey.currentContext;
      if (rootContext != null && rootContext.mounted) {
        ScaffoldMessenger.of(rootContext).showSnackBar(SnackBar(content: Text('Ошибка при загрузке типов подписок: $e'), backgroundColor: Colors.red, duration: const Duration(seconds: 3)));
      }
    }
  }

  Future<void> _openPaymentScreen(BuildContext context) async {
    print('🔵 [SelectTopicsScreen] _openPaymentScreen вызван');
    try {
      if (!context.mounted) {
        print('❌ [SelectTopicsScreen] Context not mounted');
        return;
      }

      // Проверяем статус авторизации перед открытием оплаты
      final appState = Provider.of<AppState>(context, listen: false);
      if (!appState.isAuthenticated) {
        print('❌ [SelectTopicsScreen] Пользователь не авторизован, не могу открыть оплату');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Необходима авторизация для оформления подписки'), backgroundColor: Colors.orange, duration: Duration(seconds: 3)));
        }
        return;
      }

      print('🔵 [SelectTopicsScreen] Пользователь авторизован, загружаю типы подписок...');
      // Загружаем типы подписок и находим yearly
      final paymentRepository = getIt<PaymentRepository>();
      final subscriptionTypes = await paymentRepository.getSubscriptionTypes();
      print('🔵 [SelectTopicsScreen] Типы подписок загружены: ${subscriptionTypes.length}');
      final yearlyType = subscriptionTypes.firstWhere((type) => type.code == 'rosaviatest_365' && type.isActive, orElse: () => throw Exception('Годовая подписка не найдена'));
      print('🔵 [SelectTopicsScreen] Годовая подписка найдена: ${yearlyType.name}, цена: ${yearlyType.price}');

      if (!context.mounted) {
        print('❌ [SelectTopicsScreen] Context not mounted after loading');
        return;
      }

      // Получаем root context для навигации
      final rootContext = navigatorKey.currentContext;
      if (rootContext == null || !rootContext.mounted) {
        print('❌ [SelectTopicsScreen] rootContext не доступен');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось открыть экран оплаты'), backgroundColor: Colors.red, duration: Duration(seconds: 3)));
        }
        return;
      }

      print('🔵 [SelectTopicsScreen] Вызываю PaymentHelper.createPaymentAndRedirect...');
      final result = await PaymentHelper.createPaymentAndRedirect(
        context: rootContext,
        amount: yearlyType.price.toDouble(),
        currency: 'RUB',
        description: '${yearlyType.name}, ${yearlyType.description} на ${yearlyType.periodDays} дней',
        subscriptionTypeId: yearlyType.id,
        returnRouteSource: 'select_topics',
      );
      print('✅ [SelectTopicsScreen] PaymentHelper.createPaymentAndRedirect завершен, результат: $result');
    } catch (e, stackTrace) {
      print('❌ [SelectTopicsScreen] Ошибка в _openPaymentScreen: $e');
      print('❌ [SelectTopicsScreen] StackTrace: $stackTrace');
      final rootContext = navigatorKey.currentContext;
      if (rootContext != null && rootContext.mounted) {
        ScaffoldMessenger.of(rootContext).showSnackBar(SnackBar(content: Text('Ошибка при загрузке типов подписок: $e'), backgroundColor: Colors.red, duration: const Duration(seconds: 3)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocListener<RosAviaTestCubit, RosAviaTestState>(
          listener: (context, state) {
            // Если тип сертификата изменился, перезапрашиваем категории
            if (state.typeSertificate.id != _lastCertificateTypeId) {
              _lastCertificateTypeId = state.typeSertificate.id;
              selectedCategoryId.value = <int>{};
              settingsTest.value = (mixAnswers: false, mixQuestions: false, buttonHint: false);
              BlocProvider.of<CategoriesWithListQuestionsBloc>(context).add(GetCategoriesWithListQuestionsEvent(typeSsertificatesId: state.typeSertificate.id));
            }
          },
          child: BlocBuilder<CategoriesWithListQuestionsBloc, CategoriesWithListQuestionsState>(
            builder: (context, state) => state.map(
              loading: (value) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Shimmer(
                  duration: const Duration(milliseconds: 1000),
                  interval: Duration(milliseconds: 0),
                  color: const Color(0xFF8D66FE),
                  colorOpacity: 0.5,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: 97.7,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Color(0xFFF3EFFF), borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              error: (value) => SizedBox(),
              success: (value) {
                // Обновляем количество категорий
                categoriesLenght.value = value.categoryWithQuestions.length;

                final currentCertificateTypeId = context.read<RosAviaTestCubit>().state.typeSertificate.id;

                // Если сертификат изменился, очищаем выбранные категории
                if (currentCertificateTypeId != _lastCertificateTypeId) {
                  _lastCertificateTypeId = currentCertificateTypeId;
                  selectedCategoryId.value = <int>{};
                }

                // Если категории еще не выбраны, загружаем сохраненные или выбираем все
                if (selectedCategoryId.value.isEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                    final db = getIt<AppDb>();
                    final settings = await db.getSettingsForCertificate(certificateTypeId: currentCertificateTypeId);

                    if (settings != null && mounted) {
                      // Загружаем сохраненные настройки
                      // Если нет подписки, настройки должны быть false
                      if (!_hasActiveSubscription) {
                        settingsTest.value = (mixAnswers: false, mixQuestions: false, buttonHint: false);
                      } else {
                        settingsTest.value = (mixAnswers: settings.mixAnswers, mixQuestions: settings.mixQuestions, buttonHint: settings.buttonHint);
                      }
                      selectedCategoryId.value = Set.from(settings.selectedCategoryIds);
                    } else if (mounted) {
                      // Если нет сохраненных, выбираем все категории
                      selectedCategoryId.value = value.categoryWithQuestions.map((e) => e.categoryId).toSet();
                      // Если нет подписки, настройки должны быть false
                      if (!_hasActiveSubscription) {
                        settingsTest.value = (mixAnswers: false, mixQuestions: false, buttonHint: false);
                      }
                    }
                  });
                }

                return ValueListenableBuilder(
                  valueListenable: categoriesLenght,
                  builder: (context, categoriesLenghtValue, child) {
                    return YourSpecializationWidget(
                      specialization: context.watch<RosAviaTestCubit>().state.typeSertificate.title,
                      topics: categoriesLenghtValue,
                      onTap: () => selectTypeCertificate(context: context, screen: Screens.selectTopicsScreen),
                    );
                  },
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8),
        // Убрали Expanded, так как виджет используется внутри SingleChildScrollView
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder(
              valueListenable: settingsTest,
              builder: (context, value, child) {
                return CheckboxWithTitle(
                  isSelectMixAnswers: value.mixAnswers,
                  isSelectMixQuestions: value.mixQuestions,
                  isSelectButtonHint: value.buttonHint,
                  hasActiveSubscription: _hasActiveSubscription,
                  onToggleMixAnswers: () {
                    if (_hasActiveSubscription) {
                      settingsTest.value = (mixAnswers: !value.mixAnswers, mixQuestions: value.mixQuestions, buttonHint: value.buttonHint);
                    }
                  },
                  onToggleMixQuestions: () {
                    if (_hasActiveSubscription) {
                      settingsTest.value = (mixAnswers: value.mixAnswers, mixQuestions: !value.mixQuestions, buttonHint: value.buttonHint);
                    }
                  },
                  onToggleButtonHint: () {
                    if (_hasActiveSubscription) {
                      settingsTest.value = (mixAnswers: value.mixAnswers, mixQuestions: value.mixQuestions, buttonHint: !value.buttonHint);
                    }
                  },
                  onSubscribeTap: () {
                    print('🔵 [SelectTopicsScreen] onSubscribeTap вызван');
                    if (context.mounted) {
                      _navigateToPayment(context);
                    } else {
                      print('❌ [SelectTopicsScreen] Context not mounted, используем rootContext');
                      final rootContext = navigatorKey.currentContext;
                      if (rootContext != null && rootContext.mounted) {
                        _navigateToPayment(rootContext);
                      }
                    }
                  },
                );
              },
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                SizedBox(height: 8),
                BlocBuilder<CategoriesWithListQuestionsBloc, CategoriesWithListQuestionsState>(
                  builder: (context, state) => state.map(
                    loading: (value) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Shimmer(
                        duration: const Duration(milliseconds: 1000),
                        interval: Duration(milliseconds: 0),
                        color: const Color(0xFF8D66FE),
                        colorOpacity: 0.5,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 1000,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Color(0xFFF3EFFF), borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    error: (value) => SizedBox(),
                    success: (state) => ValueListenableBuilder(
                      valueListenable: selectedCategoryId,
                      builder: (context, selected, child) {
                        final allIds = state.categoryWithQuestions.map((e) => e.categoryId).toSet();
                        final sortedCategories = [...state.categoryWithQuestions]..sort((a, b) => a.categoryId.compareTo(b.categoryId));
                        return SelectTopicsTestWidget(
                          categories: sortedCategories,
                          selectedCategoryId: selected,
                          onToggle: (int id) {
                            final next = Set<int>.from(selected);
                            if (next.contains(id)) {
                              next.remove(id);
                            } else {
                              next.add(id);
                            }
                            selectedCategoryId.value = next;
                          },
                          onToggleAll: () {
                            final allSelected = selected.length == allIds.length && allIds.isNotEmpty;
                            selectedCategoryId.value = allSelected ? <int>{} : allIds;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: CustomButton(
            title: 'Начать тестирование',
            verticalPadding: 8,
            backgroundColor: Color(0xFF0A6EFA),
            onPressed: () {
              print('🔵 [SelectTopicsScreen] Кнопка "Начать тестирование" нажата');
              print('🔵 [SelectTopicsScreen] Выбрано категорий: ${selectedCategoryId.value.length}');
              if (selectedCategoryId.value.isNotEmpty) {
                /// Возвращаем результат выбранных категорий и настроек
                final certificateTypeId = context.read<RosAviaTestCubit>().state.typeSertificate.id;
                final typeSertificate = context.read<RosAviaTestCubit>().state.typeSertificate;
                final testSettings = settingsTest.value;

                print('🔵 [SelectTopicsScreen] Подготавливаю данные для возврата');
                print('🔵 [SelectTopicsScreen] certificateTypeId: $certificateTypeId');
                print('🔵 [SelectTopicsScreen] selectedCategoryIds: ${selectedCategoryId.value}');

                // Сохраняем выбранные категории и настройки в БД
                Future.microtask(() async {
                  try {
                    final db = getIt<AppDb>();
                    await db.saveSettings(
                      certificateTypeId: certificateTypeId,
                      mixAnswers: testSettings.mixAnswers,
                      mixQuestions: testSettings.mixQuestions,
                      buttonHint: testSettings.buttonHint,
                      selectedCategoryIds: selectedCategoryId.value,
                      title: typeSertificate.title,
                      image: typeSertificate.image,
                    );
                    print('✅ [SelectTopicsScreen] Настройки сохранены в БД');
                  } catch (e) {
                    print('❌ [SelectTopicsScreen] Error saving settings: $e');
                  }
                });

                final result = (certificateTypeId, testSettings.mixAnswers, testSettings.buttonHint, selectedCategoryId.value, typeSertificate.title, typeSertificate.image, testSettings.mixQuestions);

                print('🔵 [SelectTopicsScreen] Вызываю Navigator.of(context).pop() с результатом');
                print('🔵 [SelectTopicsScreen] context.mounted: ${context.mounted}');

                if (context.mounted) {
                  Navigator.of(context, rootNavigator: true).pop(result);
                  print('✅ [SelectTopicsScreen] Navigator.of(context).pop() вызван');
                } else {
                  print('❌ [SelectTopicsScreen] Context не mounted, не могу вызвать pop()');
                }
              } else {
                print('⚠️ [SelectTopicsScreen] Категории не выбраны, показываю диалог');
                showDialog<void>(
                  context: context,
                  builder: (context) => Material(
                    type: MaterialType.transparency,
                    child: Center(
                      child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(20)), child: SelectTopicsWarningDialog()),
                    ),
                  ),
                );
              }
            },
            borderRadius: 46,
            textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
            borderColor: Color(0xFF0A6EFA),
            boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.28), blurRadius: 17.8, spreadRadius: 0, offset: Offset(0.0, 7))],
          ),
        ),
        SizedBox(height: 46),
      ],
    );
  }
}
