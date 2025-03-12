import 'package:auto_animated/auto_animated.dart';
import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_checked_cubit.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_check_list/presentation/bloc/preflight_inspection_check_list_by_category_bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

@RoutePage()
class PreflightInspectionCheckListScreen extends StatefulWidget {
  final String preflihgtInspectionCategoryId;
  final String nameCategory;
  const PreflightInspectionCheckListScreen({
    super.key,
    @PathParam('preflihgtInspectionCategoryId') required this.preflihgtInspectionCategoryId,
    @PathParam('nameCategory') required this.nameCategory,
  });

  @override
  State<PreflightInspectionCheckListScreen> createState() => _PreflightInspectionCheckListScreenState();
}

class _PreflightInspectionCheckListScreenState extends State<PreflightInspectionCheckListScreen> {
  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    context.read<PreflightInspectionCheckListByCategoryBloc>().add(
          GetPreflightInspectionCheckListByCategoryEvent(widget.preflihgtInspectionCategoryId),
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
      body: BlocBuilder<PreflightInspectionCheckListByCategoryBloc, PreflightInspectionCheckListByCategoryState>(
        builder: (context, state) => state.map(
          success: (value) {
            return _Success(
              preflightInspectionCheck: value.preflightInspectionCheckListByCategory,
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
  final List<PreflightInspectionCheckListEntity> preflightInspectionCheck;
  final int indexCheck;

  const _Success({required this.preflightInspectionCheck, required this.indexCheck});

  @override
  State<_Success> createState() => _SuccessState();
}

class _SuccessState extends State<_Success> {
  late int indexCheck;
  ButtonState state = ButtonState.idle;

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

  Future<void> buttonState() async {
    if (!mounted) return;

    setState(() => state = ButtonState.loading);
    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;

    setState(() => state = ButtonState.success);
    await Future.delayed(const Duration(milliseconds: 1000));
    if (!mounted) return;

    setState(() => state = ButtonState.idle);
  }

  Color isCheckColor(int index) {
    final state = BlocProvider.of<PreflightCheckedCubit>(context).state;
    // По preflightInspectionCategoryId (айдишник категории в предполётной подготовке) в checkProgress находим нужный список
    // с айдишниками и смотрим в нем,
    // если согласно индексу +1 (+1 потому что счетает индекс от 0) есть уже такой то показываем зелёный кубик, иначе красный
    final checkProgressByIdCategory = state.checkProgress.firstWhereOrNull(
      (e) => e.idCategory == widget.preflightInspectionCheck.first.preflightInspectionCategoryId,
    );
    return checkProgressByIdCategory?.checkedIds.contains(index + 1) == true ? Colors.green : Colors.red;
  }

  @override
  Widget build(BuildContext context) {
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
            child: BlocBuilder<PreflightCheckedCubit, PreflightCheckedState>(
              builder: (context, state) {
                return Container(
                  decoration: BoxDecoration(
                    color: isCheckColor(index),
                    border: index == indexCheck ? Border.all(color: Colors.black, width: 2) : null,
                  ),
                  child: Center(
                      child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                );
              },
            ),
          ),
        );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                LiveGrid.options(
                  shrinkWrap: true,
                  options: options,
                  itemBuilder: buildAnimatedItem,
                  itemCount: widget.preflightInspectionCheck.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                ),
                SizedBox(height: 30),
                Wrap(
                  children: [
                    Text(
                      widget.preflightInspectionCheck[indexCheck].title,
                      style: AppStyles.bigButtonCulture.copyWith(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                if (widget.preflightInspectionCheck[indexCheck].picture != null && widget.preflightInspectionCheck[indexCheck].picture!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: backUrl + widget.preflightInspectionCheck[indexCheck].picture!,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  widget.preflightInspectionCheck[indexCheck].doing,
                  style: AppStyles.bigButtonCulture,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: ProgressButton.icon(
                    maxWidth: MediaQuery.of(context).size.width,
                    radius: 16.0,
                    textStyle: AppStyles.bigButtonCulture.copyWith(color: Colors.white),
                    iconedButtons: {
                      ButtonState.idle: IconedButton(icon: Icon(Icons.check_box_outline_blank, size: 40, color: Colors.white), color: Colors.red),
                      ButtonState.loading: IconedButton(text: "Loading", color: Colors.deepPurple.shade700),
                      ButtonState.fail: IconedButton(text: "Failed", icon: Icon(Icons.cancel, color: Colors.white), color: Colors.red.shade300),
                      ButtonState.success: IconedButton(icon: Icon(Icons.check_box_outlined, size: 40, color: Colors.white), color: Colors.green)
                    },
                    onPressed: state == ButtonState.idle
                        ? () async {
                            await buttonState();

                            context.read<PreflightCheckedCubit>().setCheck(
                                  idCategory: widget.preflightInspectionCheck[indexCheck].preflightInspectionCategoryId,
                                  idCheck: indexCheck + 1,
                                );

                            if (widget.preflightInspectionCheck.length - 1 > indexCheck) {
                              setState(() => indexCheck++);
                            } else {
                              context.router.pop();
                            }
                          }
                        : () {},
                    state: state,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
