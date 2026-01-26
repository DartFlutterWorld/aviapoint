import 'package:auto_animated/auto_animated.dart';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_inspection_check_list_by_category_bloc.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/presentation/bloc/preflight_inspection_categories_bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PreflightInspectionCheckListScreen extends StatefulWidget {
  final String preflihgtInspectionCategoryId;
  const PreflightInspectionCheckListScreen({
    super.key,
    @PathParam('preflihgtInspectionCategoryId') required this.preflihgtInspectionCategoryId,
  });

  @override
  State<PreflightInspectionCheckListScreen> createState() => _PreflightInspectionCheckListScreenState();
}

class _PreflightInspectionCheckListScreenState extends State<PreflightInspectionCheckListScreen> {
  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    // Загружаем список категорий для получения названия
    context.read<PreflightInspectionCategoriesBloc>().add(GetPreflightInspectionCategoriesEvent());
    context.read<PreflightInspectionCheckListByCategoryBloc>().add(
      GetPreflightInspectionCheckListByCategoryEvent(widget.preflihgtInspectionCategoryId),
    );
  }

  String _getCategoryName(BuildContext context) {
    final categoriesState = context.read<PreflightInspectionCategoriesBloc>().state;
    return categoriesState.maybeWhen(
      success: (categories) {
        final categoryId = int.tryParse(widget.preflihgtInspectionCategoryId);
        if (categoryId != null) {
          final category = categories.firstWhereOrNull((c) => c.id == categoryId);
          return category?.title ?? 'Чек-лист';
        }
        return 'Чек-лист';
      },
      orElse: () => 'Чек-лист',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreflightInspectionCategoriesBloc, PreflightInspectionCategoriesState>(
      builder: (context, categoriesState) {
        final categoryName = _getCategoryName(context);
        return Scaffold(
          appBar: CustomAppBar(title: categoryName, withBack: true),
          backgroundColor: AppColors.background,
          body: BlocBuilder<PreflightInspectionCheckListByCategoryBloc, PreflightInspectionCheckListByCategoryState>(
            builder: (context, state) => state.map(
              success: (value) => _Success(
                preflightInspectionCheck: value.preflightInspectionCheckListByCategory,
                indexCheck: value.index,
                categoryName: categoryName,
                categoryId: widget.preflihgtInspectionCategoryId,
              ),
              loading: (value) => LoadingCustom(),
              error: (value) => ErrorCustom(
                textError: value.errorForUser,
                repeat: () {
                  context.read<PreflightInspectionCheckListByCategoryBloc>().add(
                    GetPreflightInspectionCheckListByCategoryEvent(widget.preflihgtInspectionCategoryId),
                  );
                },
              ),
              initial: (value) => Center(child: LoadingCustom()),
            ),
          ),
        );
      },
    );
  }
}

class _Success extends StatefulWidget {
  final List<PreflightInspectionCheckListEntity> preflightInspectionCheck;
  final int indexCheck;
  final String categoryName;
  final String categoryId;

  const _Success({
    required this.preflightInspectionCheck,
    required this.indexCheck,
    required this.categoryName,
    required this.categoryId,
  });

  @override
  State<_Success> createState() => _SuccessState();
}

class _SuccessState extends State<_Success> {
  late int indexCheck;
  Color numColor = Color(0xFF223B76);

  @override
  void initState() {
    super.initState();
    // Если какие то проверки уже были проведены то при заходе в категории начинаем
    // показывать проверки с следующей (после последней)
    indexCheck = widget.indexCheck;
  }

  final LiveOptions options = LiveOptions(
    delay: Duration(seconds: 0),
    showItemInterval: Duration(milliseconds: 150),
    showItemDuration: Duration(milliseconds: 250),
    visibleFraction: 0.05,
    reAnimateOnVisibility: false,
  );

  Color isCheckColor(int index) {
    final state = BlocProvider.of<PreflightCheckedCubit>(context).state;
    // По preflightInspectionCategoryId (айдишник категории в предполётной подготовке) в checkProgress находим нужный список
    // с айдишниками и смотрим в нем,
    // если согласно индексу +1 (+1 потому что счетает индекс от 0) есть уже такой то показываем зелёный кубик, иначе красный
    final checkProgressByIdCategory = state.checkProgress.firstWhereOrNull(
      (e) => e.idCategory == widget.preflightInspectionCheck.first.preflightInspectionCategoryId,
    );
    if (index == indexCheck) {
      return Color(0xFFF1F7FF);
    }
    return checkProgressByIdCategory?.checkedIds.contains(index + 1) == true ? Color(0xFF0A6EFA) : Color(0xFFF1F7FF);
  }

  Color numberColor(int index) {
    final state = BlocProvider.of<PreflightCheckedCubit>(context).state;
    // По preflightInspectionCategoryId (айдишник категории в предполётной подготовке) в checkProgress находим нужный список
    // с айдишниками и смотрим в нем,
    // если согласно индексу +1 (+1 потому что счетает индекс от 0) есть уже такой то показываем зелёный кубик, иначе красный
    final checkProgressByIdCategory = state.checkProgress.firstWhereOrNull(
      (e) => e.idCategory == widget.preflightInspectionCheck.first.preflightInspectionCategoryId,
    );
    if (index == indexCheck) {
      return Color(0xFF223B76);
    }
    return checkProgressByIdCategory?.checkedIds.contains(index + 1) == true ? Color(0xFFF1F7FF) : Color(0xFF223B76);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildAnimatedItem(BuildContext context, int index, Animation<double> animation) => FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(begin: Offset(0, -0.0), end: Offset.zero).animate(animation),
        child: BlocBuilder<PreflightCheckedCubit, PreflightCheckedState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                color: isCheckColor(index),
                borderRadius: BorderRadius.circular(6),
                border: index == indexCheck ? Border.all(color: Color(0xFF0A6EFA), width: 1) : null,
              ),
              child: Center(
                child: Text((index + 1).toString(), style: AppStyles.medium10s.copyWith(color: numberColor(index))),
              ),
            );
          },
        ),
      ),
    );

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  children: [
                    LiveGrid.options(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      options: options,
                      itemBuilder: buildAnimatedItem,
                      itemCount: widget.preflightInspectionCheck.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 15,
                        crossAxisSpacing: 4.w,
                        mainAxisSpacing: 4.h,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        widget.preflightInspectionCheck[indexCheck].title.replaceAll("\\n", "\n"),
                        style: AppStyles.bold20s.copyWith(color: Color(0xFF1F2937)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xFFFFF0ED), borderRadius: BorderRadius.circular(7.r)),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      // margin: EdgeInsets.symmetric(vertical: 12),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Row(
                          spacing: 6.w,
                          children: [
                            SvgPicture.asset(Pictures.danger),
                            Flexible(
                              child: Text(
                                widget.preflightInspectionCheck[indexCheck].doing.replaceAll("\\n", "\n").trim(),
                                style: AppStyles.regular15s.copyWith(color: Color(0xFF374151)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    if (widget.preflightInspectionCheck[indexCheck].picture != null &&
                        widget.preflightInspectionCheck[indexCheck].picture!.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: CachedNetworkImage(
                          imageUrl: getImageUrl(widget.preflightInspectionCheck[indexCheck].picture),
                          placeholder: (context, url) => LoadingCustom(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            CustomButton(
              verticalPadding: 8.h,
              backgroundColor: Color(0xFF0A6EFA),
              title: 'Выполнено',
              textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
              borderColor: Color(0xFF0A6EFA),
              borderRadius: 46.r,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff0064D6).withOpacity(0.25),
                  blurRadius: 4.r,
                  spreadRadius: 0,
                  offset: Offset(0.0, 7.h),
                ),
              ],
              onPressed: () {
                context.read<PreflightCheckedCubit>().setCheck(
                  idCategory: widget.preflightInspectionCheck[indexCheck].preflightInspectionCategoryId,
                  idCheck: indexCheck + 1,
                );

                if (widget.preflightInspectionCheck.length - 1 > indexCheck) {
                  setState(() => indexCheck++);
                } else {
                  context.router.pop();
                }
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 40),
            //   child: Container(
            //     decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 2), borderRadius: BorderRadius.circular(16)),
            //     child: ProgressButton.icon(
            //       maxWidth: MediaQuery.of(context).size.width,
            //       radius: 16.0,
            //       textStyle: AppStyles.bigButtonCulture.copyWith(color: Colors.white),
            //       iconedButtons: {
            //         ButtonState.idle: IconedButton(icon: Icon(Icons.check_box_outline_blank, size: 40, color: Colors.grey), color: Colors.white),
            //         ButtonState.loading: IconedButton(text: "Loading", color: Colors.blue),
            //         ButtonState.fail: IconedButton(text: "Failed", icon: Icon(Icons.cancel, color: Colors.white), color: Colors.red.shade300),
            //         ButtonState.success: IconedButton(icon: Icon(Icons.check_box_outlined, size: 40, color: Colors.green), color: Colors.white)
            //       },
            //       onPressed: state == ButtonState.idle
            //           ? () async {
            //               await buttonState();

            //               context.read<PreflightCheckedCubit>().setCheck(
            //                     idCategory: widget.preflightInspectionCheck[indexCheck].preflightInspectionCategoryId,
            //                     idCheck: indexCheck + 1,
            //                   );

            //               if (widget.preflightInspectionCheck.length - 1 > indexCheck) {
            //                 setState(() => indexCheck++);
            //               } else {
            //                 context.router.pop();
            //               }
            //             }
            //           : () {},
            //       state: state,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
