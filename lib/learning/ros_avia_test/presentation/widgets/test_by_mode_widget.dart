import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/answer_by_mode_widget.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/chips_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Виджет для отображения вопроса с вариантами ответов в тренировочном режиме
///
/// Этот виджет отвечает за:
/// - Отображение текста вопроса и категории
/// - Показ списка вариантов ответов
/// - Обработку выбора ответа пользователем
/// - Отображение правильного ответа после выбора
/// - Показ объяснения (обоснования) к правильному ответу
///
/// ## Параметры:
/// - `question` - сущность с данными вопроса и ответами
/// - `questionId` - уникальный ID вопроса
/// - `categoryTitle` - название категории вопроса
/// - `buttonHint` - показывать ли кнопку "Обоснование"
/// - `testMode` - режим теста (training, test и т.д.)
/// - `initialSelectedAnswerIndex` - начальное значение выбранного ответа
/// - `initialShowResults` - показывать ли результаты при инициализации
/// - `onStateChanged` - callback для уведомления родителя об изменении состояния
///
/// ## Визуальные состояния ответов:
/// - **Обычный** - светлый фон #F1F7FF
/// - **Выбран** - голубая рамка #BCD9FE (2px)
/// - **Правильный** - зеленый фон #C4F4E1 с иконкой ✓
class TestByModeWidget extends StatefulWidget {
  /// Сущность содержащая текст вопроса и список ответов
  final QuestionWithAnswersEntity question;

  /// Уникальный идентификатор вопроса
  final int questionId;

  /// Название категории, к которой относится вопрос
  final String categoryTitle;

  /// Флаг для отображения кнопки "Обоснование"
  final bool buttonHint;

  /// Режим теста (training, test и т.д.)
  /// Определяет, может ли пользователь взаимодействовать с ответами
  final TestMode testMode;

  /// Начальный индекс выбранного ответа (для восстановления состояния)
  /// Используется при восстановлении из сохраненного состояния
  final int? initialSelectedAnswerIndex;

  /// Флаг начального отображения результатов
  /// Используется при восстановлении из сохраненного состояния
  final bool initialShowResults;

  /// Callback для уведомления родителя об изменении состояния
  /// Вызывается при выборе ответа пользователем
  /// Параметры: (selectedAnswerIndex, showResults)
  final void Function(int? selectedAnswerIndex, bool showResults)? onStateChanged;

  /// Конструктор виджета
  const TestByModeWidget({
    super.key,
    required this.question,
    required this.categoryTitle,
    required this.testMode,
    required this.questionId,
    required this.buttonHint,
    this.initialSelectedAnswerIndex,
    this.initialShowResults = false,
    this.onStateChanged,
  });

  @override
  State<TestByModeWidget> createState() => _TestByModeWidgetState();
}

/// Состояние для [TestByModeWidget]
///
/// Управляет логикой выбора ответа, отображением результатов и состоянием виджета
class _TestByModeWidgetState extends State<TestByModeWidget> {
  /// Флаг для отслеживания развернуто ли окно с объяснением
  /// true = развернуто, false = свернуто
  bool _isExplanationExpanded = false;

  /// Индекс выбранного пользователем ответа
  /// null означает, что ответ еще не выбран
  int? _selectedAnswerIndex;

  /// Флаг для отображения результатов (правильный ответ)
  /// true = показывать результаты, false = скрывать
  bool _showResults = false;

  @override
  void initState() {
    super.initState();

    /// Инициализируем состояние из начальных значений
    /// Это используется для восстановления состояния при возврате к вопросу
    _selectedAnswerIndex = widget.initialSelectedAnswerIndex;
    _showResults = widget.initialShowResults;
  }

  @override
  void didUpdateWidget(TestByModeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// Сбрасываем состояние при изменении вопроса
    /// Это происходит когда пользователь переходит к следующему вопросу
    if (oldWidget.question != widget.question) {
      _selectedAnswerIndex = widget.initialSelectedAnswerIndex;
      _showResults = widget.initialShowResults;
    }
  }

  /// Обрабатывает нажатие пользователя на ответ
  ///
  /// Логика:
  /// - В режиме TestMode.training:
  ///   1. Сохраняет выбор пользователя
  ///   2. Показывает правильный ответ
  ///   3. Уведомляет родителя
  /// - В режиме TestMode.standard:
  ///   1. Сохраняет только выбор пользователя
  ///   2. НЕ показывает правильный ответ
  ///   3. Уведомляет родителя
  ///
  /// Параметр: [index] - индекс выбранного ответа
  void _handleAnswerTap(int index) {
    if (!_showResults) {
      setState(() {
        _selectedAnswerIndex = index;

        /// В тренировочном режиме показываем правильный ответ
        /// В стандартном режиме не показываем
        if (widget.testMode == TestMode.training) {
          _showResults = true;
        }
      });

      /// Уведомляем родителя о новом состоянии
      /// Родитель (TestByModeScreen) сохраняет это состояние в карте
      widget.onStateChanged?.call(_selectedAnswerIndex, _showResults);
    }
  }

  /// Находит индекс правильного ответа в списке
  ///
  /// Логика приоритета:
  /// 1. Сначала ищет ответ с `isOfficial = true` (официальный ответ)
  /// 2. Если официального ответа нет, ищет ответ с `isCorrect = true`
  /// 3. Если ничего не найдено, возвращает null
  ///
  /// Возвращает: индекс правильного ответа или null если не найден
  ///
  /// Обработка ошибок: при любой ошибке возвращает null
  int? _getCorrectAnswerIndex() {
    try {
      /// Сначала ищем официальный ответ
      int officialIndex = widget.question.answers.indexWhere((answer) => answer.isOfficial);
      if (officialIndex != -1) {
        return officialIndex;
      }

      /// Если официального нет, ищем просто правильный ответ
      int correctIndex = widget.question.answers.indexWhere((answer) => answer.isCorrect);
      if (correctIndex != -1) {
        return correctIndex;
      }

      /// Ничего не найдено
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Строит UI виджета с вопросом и ответами
    ///
    /// ## Структура:
    /// 1. **Padding** - внешние отступы
    /// 2. **Column** - основная колонка с элементами
    /// 3. **ListView** - расширяемый список с содержимым:
    ///    - Категория вопроса (ChipsWidget)
    ///    - Текст вопроса
    ///    - Список ответов (ListView.builder)
    ///    - Информационная подсказка
    ///    - Секция "Обоснование" (если buttonHint = true)
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
      child: Column(
        children: [
          SizedBox(height: 16),

          Expanded(
            child: ListView(
              children: [
                /// Строка с категорией и иконкой
                Row(
                  spacing: 12.w,
                  children: [
                    ChipsWidget(questionWithAnswers: widget.question),
                    Flexible(
                      child: Text(bigFirstSymbol(widget.categoryTitle), style: AppStyles.regular13s.copyWith(color: Color(0xFF9CA5AF))),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                /// Текст вопроса
                Text(widget.question.questionText, style: AppStyles.bold14s.copyWith(color: Color(0xFF374151))),
                SizedBox(height: 12.h),

                /// Список вариантов ответов
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.question.answers.length,
                  itemBuilder: (context, index) {
                    /// Получаем индекс правильного ответа
                    final correctAnswerIndex = _getCorrectAnswerIndex();

                    /// Проверяем, выбран ли текущий ответ
                    final isSelected = index == _selectedAnswerIndex;

                    /// Проверяем, является ли текущий ответ правильным (по индексу)
                    final isCorrect = index == correctAnswerIndex;

                    /// Определяем, показывать ли результаты (правильный ответ)
                    /// В режиме training - показываем если _showResults = true
                    /// В режиме standard - не показываем правильный ответ
                    final showAnswer = widget.testMode == TestMode.training && _showResults;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Column(
                        children: [
                          /// AnswerByModeWidget отвечает за отображение визуального стиля ответа
                          /// в зависимости от его статуса (выбран, правильный, неправильный и т.д.)
                          AnswerByModeWidget(
                            backgroundColor: Color(0xFFF1F7FF),
                            title: widget.question.answers[index].answerText,

                            /// Кнопка доступна в обоих режимах, но:
                            /// - в training: доступна до выбора ответа
                            /// - в standard: доступна всегда (пока не выбран ответ)
                            onTap: !_showResults ? () => _handleAnswerTap(index) : null,
                            isSelected: isSelected,
                            isCorrect: isCorrect,

                            /// Показываем результаты только в режиме training:
                            /// - Показываем выбранный ответ (рамка)
                            /// - Показываем правильный ответ (зеленый фон)
                            showResult: showAnswer && (isSelected || isCorrect),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.h),

                /// Информационная подсказка о правильности ответа
                Row(
                  spacing: 6,
                  children: [
                    SvgPicture.asset(Pictures.isCorrect),
                    Flexible(
                      child: Text(
                        'При прохождении тестирования или тренировки верным засчитывается ответ, считающийся таковым в официальном тесте.',
                        style: AppStyles.light12s.copyWith(color: Color(0xFF6E7A89)),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.h),

                /// Секция "Обоснование" с объяснением правильного ответа
                /// Показывается только если buttonHint = true
                if (widget.buttonHint)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GestureDetector(
                      onTap: () {
                        /// Переключаем состояние расширения/сворачивания
                        setState(() {
                          _isExplanationExpanded = !_isExplanationExpanded;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xFFF1F7FF)),
                        child: Column(
                          children: [
                            /// Заголовок "Обоснование" с иконкой стрелки
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Обоснование',
                                    style: AppStyles.bold14s.copyWith(color: Color(0xFF374151), fontWeight: FontWeight.w600),
                                  ),

                                  /// Анимированная стрелка (поворот на 180° при раскрытии)
                                  AnimatedRotation(
                                    turns: _isExplanationExpanded ? 0.5 : 0,
                                    duration: Duration(milliseconds: 200),
                                    child: SvgPicture.asset(Pictures.arrowDown, color: Color(0xFF4B5767)),
                                  ),
                                ],
                              ),
                            ),

                            /// Содержимое обоснования (видно только если развернуто)
                            if (_isExplanationExpanded)
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                                child: Text(widget.question.explanation ?? 'Скоро появится', style: AppStyles.regular14s.copyWith(color: Color(0xFF4B5767), height: 1.4)),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
