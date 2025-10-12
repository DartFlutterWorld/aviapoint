import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottomSheets.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/ros_avia_test_area_category_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/categories_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/categories_with_list_questions_bloc.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/checkbox_with_title.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/select_topics_test_widget..dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/widgets/your_specialization_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

typedef SettingsTest = ({bool mixAnswers, bool buttonHint});

class SelectTopicsScreen extends StatefulWidget {
  const SelectTopicsScreen({super.key});

  @override
  State<SelectTopicsScreen> createState() => _SelectTopicsScreenState();
}

class _SelectTopicsScreenState extends State<SelectTopicsScreen> {
  final ValueNotifier<Set<int>> selectedCategoryId = ValueNotifier<Set<int>>({});
  final ValueNotifier<int> categoriesLenght = ValueNotifier<int>(0);
  final ValueNotifier<SettingsTest> settingsTest = ValueNotifier<SettingsTest>((mixAnswers: true, buttonHint: true));
  final ValueNotifier<bool> showHelp = ValueNotifier<bool>(false);

  @override
  void initState() {
    BlocProvider.of<CategoriesWithListQuestionsBloc>(context).add(GetCategoriesWithListQuestionsEvent(typeSsertificatesId: BlocProvider.of<RosAviaTestCubit>(context).state.typeCertificateId));

    BlocProvider.of<CategoriesBloc>(context).add(GetCategoriesEvent(typeSsertificatesId: BlocProvider.of<RosAviaTestCubit>(context).state.typeCertificateId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0.w, right: 8.w, top: 8.h),
      child: Column(
        children: [
          BlocBuilder<CategoriesWithListQuestionsBloc, CategoriesWithListQuestionsState>(
            builder: (context, state) => state.map(
              loading: (value) => Shimmer(
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
              error: (value) => SizedBox(),
              success: (value) => ValueListenableBuilder(
                valueListenable: categoriesLenght,
                builder: (context, categoriesLenghtValue, child) {
                  return YourSpecializationWidget(
                    specialization: context.watch<RosAviaTestCubit>().state.typeSertificate.title,
                    topics: categoriesLenghtValue,
                    onTap: () => selectTypeCertificate(context: context, screen: Screens.selectTopicsScreen),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ValueListenableBuilder(
                  valueListenable: settingsTest,
                  builder: (context, value, child) {
                    return CheckboxWithTitle(
                      isSelectMixAnswers: value.mixAnswers,
                      isSelectButtonHint: value.buttonHint,
                      onToggleMixAnswers: () {
                        settingsTest.value = (mixAnswers: !value.mixAnswers, buttonHint: value.buttonHint);
                      },
                      onToggleButtonHint: () {
                        settingsTest.value = (mixAnswers: value.mixAnswers, buttonHint: !value.buttonHint);
                      },
                    );
                  },
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 8.h),
                    BlocConsumer<CategoriesBloc, CategoriesState>(
                      listener: (context, state) => state.maybeMap(
                        success: (value) {
                          categoriesLenght.value = value.categories.length;
                          selectedCategoryId.value = value.categories.map((e) => e.id).toSet();
                          return null;
                        },
                        orElse: () => null,
                      ),
                      builder: (context, state) => state.map(
                        loading: (value) => Shimmer(
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
                        error: (value) => SizedBox(),
                        success: (state) => ValueListenableBuilder(
                          valueListenable: selectedCategoryId,
                          builder: (context, selected, child) {
                            final allIds = state.categories.map((e) => e.id).toSet();
                            return SelectTopicsTestWidget(
                              categories: state.categories,
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
                    // SizedBox(height: 16.h)
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
            child: CustomButton(
              title: 'Начать тестирование',
              verticalPadding: 8.h,
              backgroundColor: Color(0xFF0A6EFA),
              // onPressed: () => settingsTest(context: context),
              onPressed: () => context.router.pop(selectedCategoryId.value),
              borderRadius: 46.r,
              textStyle: AppStyles.bold14s.copyWith(color: Colors.white),
              borderColor: Color(0xFF0A6EFA),
              boxShadow: [BoxShadow(color: Color(0xff0064D6).withOpacity(0.28), blurRadius: 17.8, spreadRadius: 0, offset: Offset(0.0, 7.0))],
            ),
          ),
          SizedBox(height: 46.h),
        ],
      ),
    );
  }
}
