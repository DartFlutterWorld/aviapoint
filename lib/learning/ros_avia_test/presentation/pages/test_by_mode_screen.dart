import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/repositories/ros_avia_test_repository.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/questions_by_type_certificate_and_categories_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/test_by_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Экран для отображения вопросов теста в тренировочном режиме
///
/// Этот экран позволяет пользователю проходить тестирование в тренировочном режиме
/// с возможностью:
/// - Просмотра вопроса и вариантов ответов
/// - Выбора ответа с визуальной обратной связью
/// - Просмотра объяснения к правильному ответу
/// - Переходи к следующему вопросу
///
/// ## Параметры маршрута:
/// - `typeCertificateId` - ID типа сертификата для загрузки вопросов
///
/// ## Состояние:
/// - Использует [QuestionsByTypeCertificateAndCategoriesBloc] для загрузки вопросов
/// - Хранит состояние выбранного ответа для каждого вопроса в [answerStateMap]
/// - Отслеживает текущий индекс вопроса через [indexQuestion]
@RoutePage()
class TestByModeScreen extends StatefulWidget {
  /// ID типа сертификата для загрузки вопросов теста
  final int typeCertificateId;

  /// Конструктор экрана тренировочного теста
  ///
  /// Параметр [typeCertificateId] передается через маршрут
  const TestByModeScreen({super.key, @PathParam('typeCertificateId') required this.typeCertificateId});

  @override
  State<TestByModeScreen> createState() => _TestByModeScreenState();
}

/// Состояние для экрана [TestByModeScreen]
///
/// Управляет логикой навигации между вопросами и сохранением состояния ответов
class _TestByModeScreenState extends State<TestByModeScreen> {
  /// Блок для загрузки вопросов по типу сертификата и категориям
  late QuestionsByTypeCertificateAndCategoriesBloc questionsByTypeCertificateAndCategoriesBloc;

  /// ValueNotifier для отслеживания текущего индекса вопроса
  /// Используется для перестройки UI при переходе между вопросами
  final ValueNotifier<int> indexQuestion = ValueNotifier<int>(0);

  /// ValueNotifier для отслеживания изменений в состояниях ответов
  /// Позволяет перестраивать UI при изменении выбора пользователя
  final ValueNotifier<int> answerStateChanged = ValueNotifier<int>(0);

  /// Карта для сохранения состояния ответов по индексам вопросов
  ///
  /// Структура: `questionIndex -> (selectedAnswerIndex, showResults)`
  /// - `selectedAnswerIndex`: индекс выбранного пользователем ответа (null если не выбран)
  /// - `showResults`: флаг, показывает ли правильный ответ
  ///
  /// Используется для очистки состояния при переходе к следующему вопросу
  final Map<int, ({int? selectedAnswerIndex, bool showResults})> answerStateMap = {};

  @override
  void initState() {
    /// Инициализируем блок для загрузки вопросов
    questionsByTypeCertificateAndCategoriesBloc = QuestionsByTypeCertificateAndCategoriesBloc(rosAviaTestRepository: getIt<RosAviaTestRepository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Строит UI экрана тренировочного теста
    ///
    /// ## Структура:
    /// 1. **BlocProvider** - предоставляет доступ к [QuestionsByTypeCertificateAndCategoriesBloc]
    /// 2. **Scaffold** с:
    ///    - **AppBar** - заголовок "РосАвиаТест. Тренеровка" с кнопкой назад
    ///    - **Body** (Column):
    ///      - **BlocBuilder** - реагирует на состояния блока:
    ///        - loading: показывает индикатор загрузки
    ///        - error: показывает сообщение об ошибке с кнопкой повтора
    ///        - success: показывает [TestByModeWidget] с текущим вопросом
    ///      - **ValueListenableBuilder** - реагирует на изменение индекса вопроса
    ///        - Отображает кнопку "Следующий" для навигации
    ///
    /// ## Логика работы:
    /// - При загрузке запрашиваются вопросы для выбранного типа сертификата
    /// - [TestByModeWidget] отображает текущий вопрос и управляет выбором ответа
    /// - При клике "Следующий": индекс увеличивается, состояние следующего вопроса сбрасывается
    /// - При последнем вопросе: осуществляется выход на предыдущий экран
    return BlocProvider.value(
      value: questionsByTypeCertificateAndCategoriesBloc..add(GetQuestionsByTypeCertificateAndCategories(typeSsertificatesId: widget.typeCertificateId)),
      child: Scaffold(
        appBar: CustomAppBar(title: 'РосАвиаТест. Тренеровка', withBack: true),
        backgroundColor: AppColors.background,
        body: Column(
          // shrinkWrap: true,
          children: [
            BlocBuilder<QuestionsByTypeCertificateAndCategoriesBloc, QuestionsByTypeCertificateAndCategoriesState>(
              builder: (context, state) => state.map(
                loading: (value) => Expanded(child: LoadingCustom(paddingTop: MediaQuery.of(context).size.height / 20)),
                error: (value) => ErrorCustom(
                  textError: value.errorForUser,
                  repeat: () {
                    /// Повторно загружаем вопросы при ошибке
                    questionsByTypeCertificateAndCategoriesBloc.add(GetQuestionsByTypeCertificateAndCategories(typeSsertificatesId: widget.typeCertificateId));
                  },
                ),
                success: (value) => Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: indexQuestion,
                    builder: (_, indexQuestionValue, __) {
                      /// Получаем сохраненное состояние для текущего вопроса
                      /// Если состояние существует, восстанавливаем выбранный ответ и результаты
                      final savedState = answerStateMap[indexQuestionValue];
                      return TestByModeWidget(
                        questionId: value.questionsWithAnswers[indexQuestionValue].questionId,
                        categoryTitle: value.questionsWithAnswers[indexQuestionValue].categoryTitle ?? '',
                        question: value.questionsWithAnswers[indexQuestionValue],
                        testMode: BlocProvider.of<RosAviaTestCubit>(context).state.testMode,
                        buttonHint: value.buttonHint,

                        /// Восстанавливаем состояние ответа для текущего вопроса
                        initialSelectedAnswerIndex: savedState?.selectedAnswerIndex,
                        initialShowResults: savedState?.showResults ?? false,

                        /// Сохраняем состояние при изменении выбора
                        onStateChanged: (selectedAnswerIndex, showResults) {
                          answerStateMap[indexQuestionValue] = (selectedAnswerIndex: selectedAnswerIndex, showResults: showResults);

                          /// Уведомляем слушателей об изменении состояния ответа
                          /// Просто изменяем значение чтобы ValueNotifier уведомил слушателей
                          answerStateChanged.value++;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            // SizedBox(height: 24),
            ValueListenableBuilder(
              valueListenable: answerStateChanged,
              builder: (_, __, ___) {
                /// Используем оба ValueNotifier для перестройки UI
                final currentIndexQuestion = indexQuestion.value;

                /// Получаем сохраненное состояние для текущего вопроса
                /// Проверяем, выбран ли ответ пользователем
                final savedState = answerStateMap[currentIndexQuestion];
                final isAnswerSelected = savedState?.selectedAnswerIndex != null;

                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Center(
                    child: SizedBox(
                      width: 200,
                      child: CustomButton(
                        title: 'Следующий',
                        verticalPadding: 8.h,
                        onPressed: isAnswerSelected
                            ? () {
                                /// Логика навигации к следующему вопросу
                                final state = questionsByTypeCertificateAndCategoriesBloc.state;
                                state.map(
                                  loading: (value) => null,
                                  error: (value) => null,
                                  success: (value) {
                                    /// Проверяем, есть ли следующий вопрос
                                    if (currentIndexQuestion + 1 < value.questionsWithAnswers.length) {
                                      /// Очищаем состояние для следующего вопроса
                                      /// Это нужно для того чтобы при переходе вперед показывались чистые ответы
                                      answerStateMap.remove(currentIndexQuestion + 1);

                                      /// Уведомляем об изменении перед переходом
                                      answerStateChanged.value++;
                                      indexQuestion.value++;
                                    } else {
                                      /// Если это последний вопрос, возвращаемся на предыдущий экран
                                      context.router.maybePop();
                                    }
                                    return null;
                                  },
                                );
                              }
                            : null,
                        boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.27), blurRadius: 9, spreadRadius: 0, offset: Offset(0.0, 7.0))],
                        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                        borderColor: Colors.transparent,
                        backgroundColor: Color(0xFF0A6EFA),
                        borderRadius: 46,
                        rightSvg: Pictures.rightArrowMini,

                        /// Кнопка disabled если ответ не выбран
                        disabled: !isAnswerSelected,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
