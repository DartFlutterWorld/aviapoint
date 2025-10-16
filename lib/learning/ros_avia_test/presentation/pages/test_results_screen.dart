import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/data/database/app_db.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/diagram_widget.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aviapoint/core/routes/app_router.dart';

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
  late Future<List<UserAnswer>> _answersFuture;

  @override
  void initState() {
    super.initState();
    _answersFuture = _loadAnswers();
  }

  /// Загружаем ответы из БД для текущего типа сертификата
  Future<List<UserAnswer>> _loadAnswers() async {
    try {
      final db = getIt<AppDb>();
      final answers = await (db.select(db.userAnswers)..where((tbl) => tbl.certificateTypeId.equals(widget.certificateTypeId))).get();
      return answers;
    } catch (e) {
      print('Error loading answers: $e');
      return [];
    }
  }

  /// Вычисляем статистику
  Map<String, int> _calculateStats(List<UserAnswer> answers) {
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
  Map<String, List<UserAnswer>> _groupAnswersByCategory(List<UserAnswer> answers) {
    final grouped = <String, List<UserAnswer>>{};
    for (final answer in answers) {
      final category = answer.categoryName;
      grouped.putIfAbsent(category, () => []);
      grouped[category]!.add(answer);
    }
    return grouped;
  }

  /// Форматируем процент
  double _formatPercentage(int correct, int total) {
    if (total == 0) return 0;
    return ((correct / total) * 100);
  }

  /// Строит список ответов, сгруппированных по категориям
  List<Widget> _buildCategorizedResults(List<UserAnswer> answers) {
    final grouped = _groupAnswersByCategory(answers);
    final List<Widget> result = [];

    grouped.forEach((category, categoryAnswers) {
      result.add(
        Padding(
          padding: EdgeInsets.only(bottom: 12.h),
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
                    return ChipsWidget(
                      questionWithAnswers: QuestionWithAnswersEntity(questionId: answer.questionId, questionText: '', answers: []),
                      colorBackground: isCorrect ? const Color(0xFFD8F9EC) : const Color(0xFFFFE0E0),
                      colorTitle: isCorrect ? const Color(0xFF15D585) : const Color(0xFFFF6B6B),
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
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: 'Результаты\n ${context.read<RosAviaTestCubit>().state.typeSertificate.title}', titleTextAlign: TextAlign.center, withBack: false),
      body: FutureBuilder<List<UserAnswer>>(
        future: _answersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
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
                          spacing: 12.w,
                          children: [
                            DiagramWidget(
                              percent: percentage / 100, // 80%
                              width: 160.w, // подгоните под ваш дизайн
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
                                  Text('Тем: ${_buildCategorizedResults(answers).length}', style: AppStyles.regular12s.copyWith(color: Color(0xFF6E7A89))),
                                  SizedBox(height: 8.h),
                                  Text('Вопросов: ${totalCount}', style: AppStyles.regular12s.copyWith(color: Color(0xFF6E7A89))),
                                  SizedBox(height: 8.h),
                                  ChipsWithTitleWidget(title: 'правильных ${correctCount}', colorBackground: const Color(0xFFD8F9EC), colorTitle: const Color(0xFF15D585)),
                                  SizedBox(height: 8.h),
                                  ChipsWithTitleWidget(title: 'неправильных ${totalCount - correctCount}', colorBackground: const Color(0xFFFFE0E0), colorTitle: const Color(0xFFFF6B6B)),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 24.h),

                        // Таблица результатов, сгруппированная по категориям
                        ..._buildCategorizedResults(answers),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
              // Кнопка завершения - прибита к низу
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16),
                child: Center(
                  child: SizedBox(
                    // width: 200,
                    child: CustomButton(
                      title: 'Завершить',
                      verticalPadding: 8.h,
                      onPressed: () {
                        final db = getIt<AppDb>();
                        db.clearAllAnswers(certificateTypeId: context.read<RosAviaTestCubit>().state.typeSertificate.id);
                        context.router.push(const LearningRoute());
                      },
                      boxShadow: [BoxShadow(color: const Color(0xff0064D6).withOpacity(0.27), blurRadius: 9, spreadRadius: 0, offset: const Offset(0.0, 7.0))],
                      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
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
    );
  }
}
