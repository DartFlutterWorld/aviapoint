import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/pages/category_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/domain/entities/hand_book_categories_entity.dart';
import 'package:aviapoint/learning/hand_book/main_categories_page/presentation/bloc/hand_book_main_categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HandBookMainCategoriesScreen extends StatefulWidget {
  const HandBookMainCategoriesScreen({super.key});

  @override
  State<HandBookMainCategoriesScreen> createState() => _HandBookMainCategoriesScreenState();
}

class _HandBookMainCategoriesScreenState extends State<HandBookMainCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HandBookMainCategoriesBloc>(context).add(GetHandBookMainCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Учебное пособие',
        withBack: true,
      ),
      backgroundColor: AppColors.newbg,
      body: BlocBuilder<HandBookMainCategoriesBloc, HandBookMainCategoriesState>(
        builder: (context, state) => state.map(
          success: (value) => _Success(value.handBookCategories),
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
  final List<HandBookMainCategoriesEntity> handBookCategories;
  const _Success(this.handBookCategories);

  // Выбираем на какую категорию перенаправить пользователя
  PageRouteInfo<Object?> selectSubCategory(int category) {
    switch (category) {
      case 1:
        return PreflightInspectionCategoriesRoute(nameCategory: 'Предполётные процедуры');
      case 2:
        return NormalCategoriesRoute(nameCategory: 'Нормальные процедуры');
      case 3:
        print("число равно 3");
      default:
        print("число не равно 1, 2, 3");
    }
    return BaseRoute();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: handBookCategories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CategoryWidget(
            title: handBookCategories[index].title,
            onTap: () => context.router.push(
              selectSubCategory(index + 1),
            ),
            subTitle: handBookCategories[index].subTitle,
            picture: handBookCategories[index].picture,
          ),
        ),
      ),
    ));
  }
}
