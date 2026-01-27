import 'package:auto_route/auto_route.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

typedef SettingsTest = ({bool mixAnswers, bool mixQuestions, bool buttonHint});

class SelectTopicsScreen extends StatefulWidget {
  const SelectTopicsScreen({super.key});

  @override
  State<SelectTopicsScreen> createState() => _SelectTopicsScreenState();
}

class _SelectTopicsScreenState extends State<SelectTopicsScreen> {
  final ValueNotifier<Set<int>> selectedCategoryId = ValueNotifier<Set<int>>({});
  final ValueNotifier<int> categoriesLenght = ValueNotifier<int>(0);
  final ValueNotifier<SettingsTest> settingsTest = ValueNotifier<SettingsTest>((
    mixAnswers: true,
    mixQuestions: true,
    buttonHint: true,
  ));
  late int _lastCertificateTypeId;

  @override
  void initState() {
    super.initState();
    _lastCertificateTypeId = BlocProvider.of<RosAviaTestCubit>(context).state.typeSertificate.id;
    BlocProvider.of<CategoriesWithListQuestionsBloc>(
      context,
    ).add(GetCategoriesWithListQuestionsEvent(typeSsertificatesId: _lastCertificateTypeId));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0.w, right: 8.w, top: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocListener<RosAviaTestCubit, RosAviaTestState>(
            listener: (context, state) {
              // Если тип сертификата изменился, перезапрашиваем категории
              if (state.typeSertificate.id != _lastCertificateTypeId) {
                _lastCertificateTypeId = state.typeSertificate.id;
                selectedCategoryId.value = <int>{};
                settingsTest.value = (mixAnswers: true, mixQuestions: true, buttonHint: true);
                BlocProvider.of<CategoriesWithListQuestionsBloc>(
                  context,
                ).add(GetCategoriesWithListQuestionsEvent(typeSsertificatesId: state.typeSertificate.id));
              }
            },
            child: BlocBuilder<CategoriesWithListQuestionsBloc, CategoriesWithListQuestionsState>(
              builder: (context, state) => state.map(
                loading: (value) => ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Shimmer(
                    duration: const Duration(milliseconds: 1000),
                    interval: Duration(milliseconds: 0),
                    color: const Color(0xFF8D66FE),
                    colorOpacity: 0.5,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      height: 97.7.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xFFF3EFFF), borderRadius: BorderRadius.circular(12.r)),
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
                        settingsTest.value = (
                          mixAnswers: settings.mixAnswers,
                          mixQuestions: settings.mixQuestions,
                          buttonHint: settings.buttonHint,
                        );
                        selectedCategoryId.value = Set.from(settings.selectedCategoryIds);
                      } else if (mounted) {
                        // Если нет сохраненных, выбираем все категории
                        selectedCategoryId.value = value.categoryWithQuestions.map((e) => e.categoryId).toSet();
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
          SizedBox(height: 8.h),
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
                    onToggleMixAnswers: () {
                      settingsTest.value = (
                        mixAnswers: !value.mixAnswers,
                        mixQuestions: value.mixQuestions,
                        buttonHint: value.buttonHint,
                      );
                    },
                    onToggleMixQuestions: () {
                      settingsTest.value = (
                        mixAnswers: value.mixAnswers,
                        mixQuestions: !value.mixQuestions,
                        buttonHint: value.buttonHint,
                      );
                    },
                    onToggleButtonHint: () {
                      settingsTest.value = (
                        mixAnswers: value.mixAnswers,
                        mixQuestions: value.mixQuestions,
                        buttonHint: !value.buttonHint,
                      );
                    },
                  );
                },
              ),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(height: 8.h),
                  BlocBuilder<CategoriesWithListQuestionsBloc, CategoriesWithListQuestionsState>(
                    builder: (context, state) => state.map(
                      loading: (value) => ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Shimmer(
                          duration: const Duration(milliseconds: 1000),
                          interval: Duration(milliseconds: 0),
                          color: const Color(0xFF8D66FE),
                          colorOpacity: 0.5,
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            height: 1000.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFF3EFFF),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                      ),
                      error: (value) => SizedBox(),
                      success: (state) => ValueListenableBuilder(
                        valueListenable: selectedCategoryId,
                        builder: (context, selected, child) {
                          final allIds = state.categoryWithQuestions.map((e) => e.categoryId).toSet();
                          final sortedCategories = [...state.categoryWithQuestions]
                            ..sort((a, b) => a.categoryId.compareTo(b.categoryId));
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
            padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
            child: CustomButton(
              title: 'Начать тестирование',
              verticalPadding: 8.h,
              backgroundColor: Color(0xFF0A6EFA),
              onPressed: () {
                if (selectedCategoryId.value.isNotEmpty) {
                  /// Возвращаем результат выбранных категорий и настроек
                  final certificateTypeId = context.read<RosAviaTestCubit>().state.typeSertificate.id;
                  final typeSertificate = context.read<RosAviaTestCubit>().state.typeSertificate;
                  final testSettings = settingsTest.value;

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
                    } catch (e) {
                      print('Error saving settings: $e');
                    }
                  });

                  context.router.pop((
                    certificateTypeId,
                    testSettings.mixAnswers,
                    testSettings.buttonHint,
                    selectedCategoryId.value,
                    typeSertificate.title,
                    typeSertificate.image,
                    testSettings.mixQuestions,
                  ));
                } else {
                  showDialog<void>(
                    context: context,
                    builder: (context) => Material(
                      type: MaterialType.transparency,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          child: SelectTopicsWarningDialog(),
                        ),
                      ),
                    ),
                  );
                }
              },
              borderRadius: 46.r,
              textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
              borderColor: Color(0xFF0A6EFA),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff0064D6).withOpacity(0.28),
                  blurRadius: 17.8.r,
                  spreadRadius: 0,
                  offset: Offset(0.0, 7.h),
                ),
              ],
            ),
          ),
          SizedBox(height: 46.h),
        ],
      ),
    );
  }
}
