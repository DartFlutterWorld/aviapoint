import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/pages/category_widget.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/hand_book/emegrency_categories_page/domain/entities/emergency_categories_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FiresSubCategoriesScreen extends StatefulWidget {
  final String nameCategory;
  const FiresSubCategoriesScreen({
    super.key,
    @PathParam('nameCategory') required this.nameCategory,
  });

  @override
  State<FiresSubCategoriesScreen> createState() => _FiresSubCategoriesScreenState();
}

class _FiresSubCategoriesScreenState extends State<FiresSubCategoriesScreen> {
  List<EmergencyCategoriesEntity> subCategory = [
    EmergencyCategoriesEntity(
      id: 1,
      title: 'fires_during_start_on_ground'.tr(),
      subTitle: '',
      subTitleEng: '',
      mainCategoryId: 0,
      titleEng: '',
      picture: '',
    ),
    EmergencyCategoriesEntity(
      id: 2,
      title: 'engine_fire_in_flight'.tr(),
      subTitle: '',
      subTitleEng: '',
      mainCategoryId: 0,
      titleEng: '',
      picture: '',
    ),
    EmergencyCategoriesEntity(
      id: 3,
      title: 'electrical_fire_in_flight'.tr(),
      subTitle: '',
      subTitleEng: '',
      mainCategoryId: 0,
      titleEng: '',
      picture: '',
    ),
    EmergencyCategoriesEntity(
      id: 4,
      title: 'cabin_fire'.tr(),
      subTitle: '',
      subTitleEng: '',
      mainCategoryId: 0,
      titleEng: '',
      picture: '',
    ),
    EmergencyCategoriesEntity(
      id: 5,
      title: 'wing_fire'.tr(),
      subTitle: '',
      subTitleEng: '',
      mainCategoryId: 0,
      titleEng: '',
      picture: '',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.nameCategory,
        withBack: true,
        // actions: [
        //   IconButton(
        //     onPressed: () => context.read<EmergencyCheckedCubit>().clearAllCategory(),
        //     icon: SvgPicture.asset(Pictures.round_clear2),
        //   ),
        // ],
      ),
      backgroundColor: AppColors.newbg,
      body: _Success(subCategory),
    );
  }
}

class _Success extends StatelessWidget {
  final List<EmergencyCategoriesEntity> emergencyCategories;
  const _Success(this.emergencyCategories);

  PageRouteInfo<Object?> navigateToCategory(int category) {
    switch (category) {
      case 1:
        return FiresDuringStartOnGroundRoute();
      case 2:
        return EngineFireInFlightRoute();
      case 3:
        return ElectricalFireInFlightRoute();
      case 4:
        return CabinFireRoute();
      case 5:
        return WingFireRoute();
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
          clipBehavior: Clip.none,
          itemCount: emergencyCategories.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CategoryWidget(
              title: capitalizeSentence(emergencyCategories[index].title),
              onTap: () => context.router.push(navigateToCategory(index + 1)),
              subTitle: capitalizeSentence(emergencyCategories[index].subTitle),
              picture: emergencyCategories[index].picture,
              icon: Pictures.strelka,
              clearCategory: () {},
            ),
          ),
        ),
      ),
    );
  }
}
