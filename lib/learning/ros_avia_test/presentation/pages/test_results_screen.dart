import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/data/database/app_db.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/diagram_widget.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/chips_widget.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/chips_with_title_widget.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/ros_avia_test_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/categories_with_list_questions_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/repositories/ros_avia_test_repository.dart';

/// Экран результатов тестирования
/// Отображает таблицу с ответами пользователя и правильными ответами
///
/// Параметры:
/// - certificateTypeId: ID типа сертификата
@RoutePage()
class TestResultsScreen extends StatefulWidget {
  const TestResultsScreen({required this.certificateTypeId, Key? key}) : super(key: key);

  final int certificateTypeId;

  @override
  State<TestResultsScreen> createState() => _TestResultsScreenState();
}

class _TestResultsScreenState extends State<TestResultsScreen> {
  late Future<List<TestAnswer>> _answersFuture;
  Map<int, QuestionWithAnswersEntity> _questionsMap = {}; // Кэш вопросов по ID

  @override
  void initState() {
    super.initState();
    _answersFuture = _loadAnswers();
  }

  /// Загружаем все категории и заполняем кэш
  Future<void> _loadCategoriesCache() async {
    try {
      final rosAviaTestRepository = getIt<RosAviaTestRepository>();
      final certificateTypeId = context.read<RosAviaTestCubit>().state.typeSertificate.id;

      final categoriesResult = await rosAviaTestRepository.fetchRosAviaTestCategoryWithQuestions(certificateTypeId);

      categoriesResult.fold((failure) {}, (categories) {
        for (final category in categories) {
          for (final question in category.questionsWithAnswers) {
            _questionsMap[question.questionId] = question;
          }
        }
      });
    } catch (e) {}
  }

  /// Загружаем ответы из таблицы TestAnswers
  Future<List<TestAnswer>> _loadAnswers() async {
    try {
      final db = getIt<AppDb>();
      final certificateTypeId = context.read<RosAviaTestCubit>().state.typeSertificate.id;

      // Сначала загружаем все категории чтобы заполнить кэш
      await _loadCategoriesCache();

      final answers = await db.getAnswersByCertificateType(certificateTypeId);

      return answers;
    } catch (e) {
      return [];
    }
  }

  /// Вычисляем статистику
  Map<String, int> _calculateStats(List<TestAnswer> answers) {
    int correct = 0;
    int incorrect = 0;

    for (final answer in answers) {
      if (answer.isCorrect == true) {
        correct++;
      } else {
        incorrect++;
      }
    }

    return {'correct': correct, 'incorrect': incorrect, 'total': answers.length};
  }

  /// Группируем ответы по категориям
  Map<String, List<TestAnswer>> _groupAnswersByCategory(List<TestAnswer> answers) {
    final grouped = <String, List<TestAnswer>>{};

    for (final answer in answers) {
      // Получаем название категории из кэша по questionId
      final question = _questionsMap[answer.questionId];
      final categoryKey = question?.categoryTitle ?? 'Категория ${answer.categoryId}';

      grouped.putIfAbsent(categoryKey, () => []);
      grouped[categoryKey]!.add(answer);
    }

    return grouped;
  }

  /// Форматируем процент
  double _formatPercentage(int correct, int total) {
    if (total == 0) return 0;
    return ((correct / total) * 100);
  }

  /// Строит список ответов, сгруппированных по категориям
  List<Widget> _buildCategorizedResults(List<TestAnswer> answers) {
    final grouped = _groupAnswersByCategory(answers);
    final List<Widget> result = [];

    grouped.forEach((category, categoryAnswers) {
      result.add(
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: RosAviaTestCategoryWidget(
            withArrow: false,
            title: bigFirstSymbol(category),
            subTitle: '',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: categoryAnswers.map((answer) {
                    final isCorrect = answer.isCorrect == true;
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        try {
                          openQuestion(
                            context: context,
                            question: _questionsMap[answer.questionId], // Берем вопрос из кэша
                            questionId: answer.questionId,
                            categoryTitle: _questionsMap[answer.questionId]?.categoryTitle ?? 'Без категории',
                          ).catchError((Object error) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка при открытии вопроса')));
                            }
                          });
                        } catch (e) {}
                      },
                      child: ChipsWidget(
                        questionWithAnswers: QuestionWithAnswersEntity(
                          questionId: answer.questionId,
                          questionText: '',
                          answers: [],
                          categoryTitle: _questionsMap[answer.questionId]?.categoryTitle ?? 'Категория ${answer.categoryId}',
                          categoryId: answer.categoryId,
                        ),
                        colorBackground: isCorrect ? const Color(0xFFD8F9EC) : const Color(0xFFFFE0E0),
                        colorTitle: isCorrect ? const Color(0xFF15D585) : const Color(0xFFFF6B6B),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesWithListQuestionsBloc, CategoriesWithListQuestionsState>(
      listener: (context, state) {
        state.maybeMap(
          success: (value) {
            // Заполняем кэш вопросов из загруженных категорий
            for (final category in value.categoryWithQuestions) {
              for (final question in category.questionsWithAnswers) {
                _questionsMap[question.questionId] = question;
              }
            }
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(title: 'Результаты\n ${context.read<RosAviaTestCubit>().state.typeSertificate.title}', titleTextAlign: TextAlign.center, withBack: false),
        body: FutureBuilder<List<TestAnswer>>(
          future: _answersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: LoadingCustom());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Ошибка: ${snapshot.error}'));
            }

            final answers = snapshot.data ?? [];

            if (answers.isEmpty) {
              return const Center(child: Text('Нет результатов'));
            }

            final stats = _calculateStats(answers);
            final correctCount = stats['correct']!;
            final totalCount = stats['total']!;
            final percentage = _formatPercentage(correctCount, totalCount);

            final categorizedResults = _buildCategorizedResults(answers);

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            spacing: 12,
                            children: [
                              DiagramWidget(
                                percent: percentage / 100, // 80%
                                width: 160, // подгоните под ваш дизайн
                                strokeWidth: 30,
                                gradientColors: const [
                                  Color(0xFF2F7C5A), // тёмно-зелёный
                                  Color(0xFF78FBAE), // мятный
                                ],
                                trackColor: const Color(0xFFE8EFFF), // светло-голубой фон дуги
                                // Кастомный центр (если хотите заменить дефолтный текст):
                                centerBuilder: (ctx, p) => Padding(
                                  padding: const EdgeInsets.only(top: 50.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [Text('${percentage.toInt().toString()}%', style: AppStyles.extraBold.copyWith(color: Color(0xFF223B76)))],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Тем: ${categorizedResults.length}', style: AppStyles.regular12s.copyWith(color: Color(0xFF6E7A89))),
                                    SizedBox(height: 8),
                                    Text('Вопросов: ${totalCount}', style: AppStyles.regular12s.copyWith(color: Color(0xFF6E7A89))),
                                    SizedBox(height: 8),
                                    ChipsWithTitleWidget(title: 'правильных ${correctCount}', colorBackground: const Color(0xFFD8F9EC), colorTitle: const Color(0xFF15D585)),
                                    SizedBox(height: 8),
                                    ChipsWithTitleWidget(title: 'неправильных ${totalCount - correctCount}', colorBackground: const Color(0xFFFFE0E0), colorTitle: const Color(0xFFFF6B6B)),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 24),

                          // Таблица результатов, сгруппированная по категориям
                          ...categorizedResults,
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
                // Кнопка завершения - прибита к низу
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Center(
                    child: SizedBox(
                      // width: 200,
                      child: CustomButton(
                        title: 'Завершить',
                        verticalPadding: 8,
                        onPressed: () async {
                          // Очистить ответы и выбранные вопросы перед уходом
                          await getIt<AppDb>().deleteAnswersByCertificateType(widget.certificateTypeId);
                          await getIt<AppDb>().deleteSelectedQuestions(widget.certificateTypeId);
                          if (mounted) {
                            // Возвращаемся на экран выбора режима тестирования
                            context.router.push(
                              BaseRoute(
                                children: [
                                  LearningNavigationRoute(children: [TestingModeRoute()]),
                                ],
                              ),
                            );
                          }
                        },
                        boxShadow: [BoxShadow(color: const Color(0xff0064D6).withOpacity(0.27), blurRadius: 9, spreadRadius: 0, offset: const Offset(0.0, 7.0))],
                        textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                        borderColor: Colors.transparent,
                        backgroundColor: const Color(0xFF0A6EFA),
                        borderRadius: 46,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
