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
class ElectricalPowerSubCategoryScreen extends StatefulWidget {
  final String nameCategory;
  const ElectricalPowerSubCategoryScreen({
    super.key,
    @PathParam('nameCategory') required this.nameCategory,
  });

  @override
  State<ElectricalPowerSubCategoryScreen> createState() => _ElectricalPowerSubCategoryScreenState();
}

class _ElectricalPowerSubCategoryScreenState extends State<ElectricalPowerSubCategoryScreen> {
  List<EmergencyCategoriesEntity> subCategory = [
    EmergencyCategoriesEntity(
      id: 1,
      title: 'high_volts_annunciator_comes_on_or_m_batt_amps_more_than_40'.tr(),
      subTitle: '',
      subTitleEng: '',
      mainCategoryId: 0,
      titleEng: '',
      picture: '',
    ),
    EmergencyCategoriesEntity(
      id: 2,
      title: 'low_volts_annunciator_comes_on_bellow_1000_rpm'.tr(),
      subTitle: '',
      subTitleEng: '',
      mainCategoryId: 0,
      titleEng: '',
      picture: '',
    ),
    EmergencyCategoriesEntity(
      id: 3,
      title: 'low_volts_annunciator_comes_on_or_does_not_go_off_at_higher_rpm'.tr(),
      subTitle: '',
      subTitleEng: '',
      mainCategoryId: 0,
      titleEng: '',
      picture: '',
    ),
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
        return ElectricalPowerSupplySystemMalfunctionsRoute();
      case 2:
        return LowVoltsAnnunciatorComesOnBellow1000RpmRoute();
      case 3:
        return LowVoltsAnnunciatorComesOnOrDoesNotGoOffAtHigherRpmRoute();

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
              title: emergencyCategories[index].title,
              onTap: () => context.router.push(navigateToCategory(index + 1)),
              subTitle: emergencyCategories[index].subTitle,
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
