import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/pages/category_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/domain/entities/preflight_inspection_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/preflight_inspection_categories_page/presentation/bloc/preflight_inspection_categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PreflightInspectionCategoriesScreen extends StatefulWidget {
  const PreflightInspectionCategoriesScreen({super.key});

  @override
  State<PreflightInspectionCategoriesScreen> createState() => _PreflightInspectionCategoriesScreenState();
}

class _PreflightInspectionCategoriesScreenState extends State<PreflightInspectionCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PreflightInspectionCategoriesBloc>(context).add(GetPreflightInspectionCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Подкатегории',
        withBack: true,
      ),
      backgroundColor: AppColors.newbg,
      body: BlocBuilder<PreflightInspectionCategoriesBloc, PreflightInspectionCategoriesState>(
        builder: (context, state) => state.map(
          success: (value) => _Success(value.preflightInspectionCategories),
          loading: (value) => Center(
            child: CircularProgressIndicator(),
          ),
          error: (value) => Center(
            child: Text(value.errorForUser),
          ),
        ),
      ),
    );
  }
}

class _Success extends StatelessWidget {
  final List<PreflightInspectionCategoriesEntity> preflightInspectionCategories;
  const _Success(this.preflightInspectionCategories);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: preflightInspectionCategories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CategoryWidget(
            title: preflightInspectionCategories[index].title,
            onTap: () {},
            subTitle: '',
            picture: preflightInspectionCategories[index].picture,
          ),
        ),
      ),
    ));
  }
}
