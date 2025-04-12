import 'package:auto_animated/auto_animated.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_button.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottomSheets.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/domain/entities/normal_check_list_entity.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_check_list_by_category_bloc.dart';
import 'package:aviapoint/learning/hand_book/normal_check_list/presentation/bloc/normal_checked_cubit.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      backgroundColor: AppColors.newbg,
      body: BlocBuilder<NormalCheckListByCategoryBloc, NormalCheckListByCategoryState>(
        builder: (context, state) => state.map(
          success: (value) {
            return _Success(
              normalCheck: value.normalCheckListByCategory,
              indexCheck: value.index,
            );
          },
          loading: (value) => Center(
            child: CircularProgressIndicator(),
          ),
          error: (value) => Center(
            child: Text(value.errorForUser),
          ),
          initial: (value) => Center(
            child: CircularProgressIndicator(),
          ),
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
      return Colors.white;
    }
    return checkProgressByIdCategory?.checkedIds.contains(index + 1) == true ? Colors.green : Colors.red;
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
                    border: index == indexCheck ? Border.all(color: Colors.blue, width: 1.5) : null,
                  ),
                  child: Center(
                      child: Text(
                    (index + 1).toString(),
                    style: AppStyles.subSmallSemi.copyWith(
                      color: index == indexCheck ? Colors.black : Colors.white,
                    ),
                  )),
                );
              },
            ),
          ),
        );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 20, top: 8),
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
                SizedBox(height: 30),
                Column(
                  children: [
                    if (normalCheck[indexCheck].subCategory != null)
                      Text(
                        normalCheck[indexCheck].subCategory ?? '',
                        style: AppStyles.adress.copyWith(color: AppColors.mainSolid),
                      ),
                    SizedBox(height: 8),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: AutoSizeText(
                            normalCheck[indexCheck].title.replaceAll("\\n", "\n"),
                            style: AppStyles.bigButtonCulture.copyWith(fontSize: 22),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    if (normalCheck[indexCheck].picture != null && normalCheck[indexCheck].picture!.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: backUrl + normalCheck[indexCheck].picture!,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: AutoSizeText(
                        normalCheck[indexCheck].doing.replaceAll("\\n", "\n"),
                        style: AppStyles.bigButtonCulture,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CustomButton(
                  title: 'Checked',
                  textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp, height: 1, color: AppColors.mainSolid),
                  borderColor: Colors.blue,
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
      ),
    );
  }
}
