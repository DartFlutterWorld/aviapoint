import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/pages/category_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottomSheets.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/question_with_answers_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_category_with_questions_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_correct_answer_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/categories_with_list_questions_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/type_correct_answers_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/correct_answer.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/chips_widget.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/ros_avia_test_category_widget.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/test_my_self_widget.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/your_specialization_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class BaseQuestionsScreen extends StatefulWidget {
  const BaseQuestionsScreen({super.key});

  @override
  State<BaseQuestionsScreen> createState() => _BaseQuestionsScreenState();
}

class _BaseQuestionsScreenState extends State<BaseQuestionsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesWithListQuestionsBloc>(context).add(GetCategoriesWithListQuestionsEvent(typeSsertificatesId: BlocProvider.of<RosAviaTestCubit>(context).state.typeSertificate.id));
    BlocProvider.of<TypeCorrectAnswersBloc>(context).add(GetTypeCorrectAnswersEvent());
    // BlocProvider.of<EmergencyCheckListBloc>(context).add(GetEmergencyCheckListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'РосАвиаТест. Обучение',
        withBack: true,
        // actions: [
        //   IconButton(
        //     onPressed: () => context.read<EmergencyCheckedCubit>().clearAllCategory(),
        //     icon: SvgPicture.asset(Pictures.round_clear2),
        //   ),
        // ],
      ),
      backgroundColor: AppColors.background,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          SizedBox(height: 16),
          TestMySelfWidget(),
          SizedBox(height: 12),
          BlocBuilder<CategoriesWithListQuestionsBloc, CategoriesWithListQuestionsState>(
            builder: (context, state) => state.map(
              loading: (value) => SizedBox(),
              error: (value) => SizedBox(),
              success: (value) => YourSpecializationWidget(
                specialization: context.watch<RosAviaTestCubit>().state.typeSertificate.title,
                topics: value.categoryWithQuestions.length,
                onTap: () => selectTypeCertificate(context: context, screen: Screens.learning),
              ),
            ),
          ),
          SizedBox(height: 12),
          BlocBuilder<TypeCorrectAnswersBloc, TypeCorrectAnswersState>(
            builder: (context, state) => state.maybeMap(
              orElse: () => SizedBox.shrink(),
              success: (value) => _SuccessTypeCorrectAnswers(value.typeCorrectAnswer),
              // loading: (value) => LoadingCustom(),
              // error: (value) => ErrorCustom(
              //   textError: value.errorForUser,
              //   repeat: () {
              //     BlocProvider.of<TypeCorrectAnswersBloc>(context).add(GetTypeCorrectAnswersEvent());
              //   },
              // ),
            ),
          ),
          SizedBox(height: 12),
          BlocBuilder<CategoriesWithListQuestionsBloc, CategoriesWithListQuestionsState>(
            builder: (context, state) => state.map(
              success: (value) => _Success(value.categoryWithQuestions),
              loading: (value) => LoadingCustom(),
              error: (value) => ErrorCustom(
                paddingTop: 100,
                textError: value.errorForUser,
                repeat: () {
                  BlocProvider.of<CategoriesWithListQuestionsBloc>(
                    context,
                  ).add(GetCategoriesWithListQuestionsEvent(typeSsertificatesId: BlocProvider.of<RosAviaTestCubit>(context).state.typeSertificate.id));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuccessTypeCorrectAnswers extends StatelessWidget {
  final List<TypeCorrectAnswerEntity> typeCorrectAnswer;
  const _SuccessTypeCorrectAnswers(this.typeCorrectAnswer);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Правильность ответа', style: AppStyles.medium10s.copyWith(color: Color(0xFF374151))),
        SizedBox(height: 7),
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: [...typeCorrectAnswer.map((e) => CorrectAnswer(color: getColors(e.id).$1, title: e.title, colorTitle: getColors(e.id).$2))],
        ),
      ],
    );
  }
}

class _Success extends StatelessWidget {
  final List<RosAviaTestCategoryWithQuestionsEntity> categoryWithQuestions;
  const _Success(this.categoryWithQuestions);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12.h,
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: categoryWithQuestions.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => context.router.push(
                    ListQuestionByCategoryRoute(
                      questionWithAnswersList: categoryWithQuestions[index].questionsWithAnswers,
                      categoryTitle: categoryWithQuestions[index].categoryTitle,
                      categoryId: categoryWithQuestions[index].categoryId,
                    ),
                  ),
                  child: RosAviaTestCategoryWidget(
                    title: bigFirstSymbol(categoryWithQuestions[index].categoryTitle),
                    subTitle: '',

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Wrap(
                          children: List.generate(
                            categoryWithQuestions[index].questionsWithAnswers.length,
                            (index2) => Padding(
                              padding: EdgeInsets.only(right: 3, left: 3, top: 3, bottom: 3),
                              child: GestureDetector(
                                onTap: () => openQuestion(
                                  context: context,
                                  question: categoryWithQuestions[index].questionsWithAnswers[index2],
                                  questionId: categoryWithQuestions[index].questionsWithAnswers[index2].questionId,
                                  categoryTitle: categoryWithQuestions[index].categoryTitle,
                                ),
                                child: ChipsWidget(questionWithAnswers: categoryWithQuestions[index].questionsWithAnswers[index2]),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Всего вопросов: ${categoryWithQuestions[index].questionsCount.toString()}',
                          style: AppStyles.medium10s.copyWith(color: Color(0xFF9CA5AF)),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
