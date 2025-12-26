import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/pages/category_widget.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/learning/ros_avia_test/domain/entities/type_sertificates_entity.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/ros_avia_test_cubit.dart';
import 'package:aviapoint/learning/ros_avia_test/presentation/bloc/type_sertificates_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TypeSertificatesScreen extends StatefulWidget {
  final String title;
  const TypeSertificatesScreen({super.key, required this.title});

  @override
  State<TypeSertificatesScreen> createState() => _TypeSertificatesScreenState();
}

class _TypeSertificatesScreenState extends State<TypeSertificatesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TypeSertificatesBloc>(context).add(GetTypeSertificatesEvent());
    // BlocProvider.of<EmergencyCheckListBloc>(context).add(GetEmergencyCheckListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TypeSertificatesBloc, TypeSertificatesState>(
      builder: (context, state) => state.map(
        success: (value) => _Success(value.typeSertificates),
        loading: (value) => LoadingCustom(),
        error: (value) => ErrorCustom(
          textError: value.errorForUser,
          repeat: () {
            BlocProvider.of<TypeSertificatesBloc>(context).add(GetTypeSertificatesEvent());
          },
        ),
      ),
    );
  }
}

class _Success extends StatelessWidget {
  final List<TypeSertificatesEntity> typeSertificatesEntity;
  const _Success(this.typeSertificatesEntity);

  String getIcon(int index) {
    switch (index) {
      case 1 || 2 || 3 || 4 || 5 || 6 || 7 || 8 || 9 || 10 || 11 || 14 || 19:
        return Pictures.pilotsIcon;
      case 13 || 17:
        return Pictures.bortIngener;
      case 18:
        return Pictures.bortProvodnik;
      case 20:
        return Pictures.otherSotrudnik;
      case 12 || 16 || 21 || 22 || 23:
        return Pictures.dispetcher;

      default:
        return Pictures.pilotsIcon;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        children: [
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => context.router.maybePop(null),
              child: SizedBox(width: 30, height: 30, child: Center(child: SvgPicture.asset(Pictures.closeAuth))),
            ),
          ),
          Text('Выберите тип свидетельства', style: AppStyles.semibpld14s.copyWith(color: Color(0xFF374151))),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              // clipBehavior: Clip.none,
              itemCount: typeSertificatesEntity.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: CategoryWidget(
                  title: bigFirstSymbol(typeSertificatesEntity[index].title),
                  onTap: () {
                    context.router.maybePop(typeSertificatesEntity[index]);
                  },
                  subTitle: '',
                  clearCategory: () {},
                  withClear: false,
                  image: getIcon(typeSertificatesEntity[index].id),
                  isSelect:
                      BlocProvider.of<RosAviaTestCubit>(context).state.typeSertificate.title ==
                      typeSertificatesEntity[index].title,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
