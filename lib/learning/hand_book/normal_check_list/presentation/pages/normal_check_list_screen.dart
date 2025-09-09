import 'package:auto_animated/auto_animated.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottomSheets.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/domain/entities/normal_check_list_entity.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_check_list_by_category_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_checked_cubit.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class NormalCheckListScreen extends StatefulWidget {
  final String normalCategoryId;
  final String nameCategory;
  const NormalCheckListScreen({
    super.key,
    @PathParam('normalCategoryId') required this.normalCategoryId,
    @PathParam('nameCategory') required this.nameCategory,
  });

  @override
  State<NormalCheckListScreen> createState() => _NormalCheckListScreenState();
}

class _NormalCheckListScreenState extends State<NormalCheckListScreen> {
  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    context.read<NormalCheckListByCategoryBloc>().add(
          GetNormalCheckListByCategoryEvent(widget.normalCategoryId),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.nameCategory,
        withBack: true,
      ),
      backgroundColor: AppColors.background,
      body: BlocBuilder<NormalCheckListByCategoryBloc, NormalCheckListByCategoryState>(
        builder: (context, state) => state.map(
          success: (value) {
            return _Success(
              normalCheck: value.normalCheckListByCategory,
              indexCheck: value.index,
            );
          },
          loading: (value) => LoadingCustom(),
          error: (value) => ErrorCustom(
            textError: value.errorForUser,
            repeat: () {
              context.read<NormalCheckListByCategoryBloc>().add(
                    GetNormalCheckListByCategoryEvent(widget.normalCategoryId),
                  );
            },
          ),
          initial: (value) => LoadingCustom(),
        ),
      ),
    );
  }
}

class _Success extends StatefulWidget {
  final List<NormalCheckListEntity> normalCheck;
  final int indexCheck;

  const _Success({required this.normalCheck, required this.indexCheck});

  @override
  State<_Success> createState() => _SuccessState();
}

class _SuccessState extends State<_Success> {
  late int indexCheck;

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
    final state = BlocProvider.of<NormalCheckedCubit>(context).state;
    // По NormalInspectionCategoryId (айдишник категории в предполётной подготовке) в checkProgress находим нужный список
    // с айдишниками и смотрим в нем,
    // если согласно индексу +1 (+1 потому что счетает индекс от 0) есть уже такой то показываем зелёный кубик, иначе красный
    final checkProgressByIdCategory = state.checkProgress.firstWhereOrNull(
      (e) => e.idCategory == widget.normalCheck.first.normalCategoryId,
    );
    if (index == indexCheck) {
      return Color(0xFFF1F7FF);
    }
    return checkProgressByIdCategory?.checkedIds.contains(index + 1) == true ? Color(0xFF0A6EFA) : Color(0xFFF1F7FF);
  }

  Color numberColor(int index) {
    final state = BlocProvider.of<NormalCheckedCubit>(context).state;
    // По preflightInspectionCategoryId (айдишник категории в предполётной подготовке) в checkProgress находим нужный список
    // с айдишниками и смотрим в нем,
    // если согласно индексу +1 (+1 потому что счетает индекс от 0) есть уже такой то показываем зелёный кубик, иначе красный
    final checkProgressByIdCategory = state.checkProgress.firstWhereOrNull(
      (e) => e.idCategory == widget.normalCheck.first.normalCategoryId,
    );
    if (index == indexCheck) {
      return Color(0xFF223B76);
    }
    return checkProgressByIdCategory?.checkedIds.contains(index + 1) == true ? Color(0xFFF1F7FF) : Color(0xFF223B76);
  }

  @override
  Widget build(BuildContext context) {
    final normalCheck = widget.normalCheck.where((e) => e.checkList == false).toList();
    final normalCheckList = widget.normalCheck.where((e) => e.checkList == true).toList();
    final indexChecklist = widget.normalCheck.firstWhereOrNull((e) => e.checkList == true)?.id;
    Widget buildAnimatedItem(
      BuildContext context,
      int index,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.0),
              end: Offset.zero,
            ).animate(animation),
            child: BlocBuilder<NormalCheckedCubit, NormalCheckedState>(
              builder: (context, state) {
                return Container(
                  decoration: BoxDecoration(
                    color: isCheckColor(index),
                    borderRadius: BorderRadius.circular(6),
                    border: index == indexCheck ? Border.all(color: Color(0xFF0A6EFA), width: 1) : null,
                  ),
                  child: Center(
                      child: Text(
                    (index + 1).toString(),
                    style: AppStyles.medium10s.copyWith(color: numberColor(index)),
                  )),
                );
              },
            ),
          ),
        );

    return Padding(
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8,
        top: 8,
        bottom: MediaQuery.of(context).padding.bottom + 40,
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              LiveGrid.options(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                options: options,
                itemBuilder: buildAnimatedItem,
                itemCount: normalCheck.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 15,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
              ),
              SizedBox(height: 24),
              Wrap(
                children: [
                  if (normalCheck[indexCheck].subCategory != null && normalCheck[indexCheck].subCategory!.isNotEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          normalCheck[indexCheck].subCategory ?? '',
                          style: AppStyles.medium10s.copyWith(color: Color(0xFF1F2937)),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      normalCheck[indexCheck].title.replaceAll("\\n", "\n"),
                      style: AppStyles.bold20s.copyWith(color: Color(0xFF1F2937)),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFFFFF0ED), borderRadius: BorderRadius.circular(7)),
                padding: EdgeInsets.symmetric(horizontal: 8),
                // margin: EdgeInsets.symmetric(vertical: 12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      SvgPicture.asset(Pictures.danger),
                      SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          normalCheck[indexCheck].doing.replaceAll("\\n", "\n").trim(),
                          style: AppStyles.regular15s.copyWith(color: Color(0xFF374151)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              if (normalCheck[indexCheck].picture != null && normalCheck[indexCheck].picture!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: backUrl + normalCheck[indexCheck].picture!,
                    placeholder: (context, url) => LoadingCustom(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              Spacer(),
              CustomButton(
                verticalPadding: 8,
                backgroundColor: Color(0xFF0A6EFA),
                title: 'Выполнено',
                textStyle: AppStyles.bold16s.copyWith(color: Colors.white),
                borderColor: Color(0xFF0A6EFA),
                borderRadius: 46,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff0064D6).withOpacity(0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(
                      0.0,
                      7.0,
                    ),
                  ),
                ],
                onPressed: () async {
                  context.read<NormalCheckedCubit>().setCheck(
                        idCategory: normalCheck[indexCheck].normalCategoryId,
                        idCheck: indexCheck + 1,
                      );

                  if (normalCheck.length - 1 > indexCheck) {
                    setState(() => indexCheck++);
                    // Если контрольная проверка находится в середине списка
                    if (indexChecklist != null && indexCheck == indexChecklist - 1) {
                      checkList(context: context, checkList: normalCheckList);
                    }
                  } else {
                    // Если контрольная проверка находится в конце списка
                    if (indexChecklist != null && indexCheck < indexChecklist - 1) {
                      await checkList(context: context, checkList: normalCheckList);
                    }
                    context.router.maybePop();
                  }
                },
              )
            ],
          )),
    );
  }
}
