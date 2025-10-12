import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/auth_page/presentation/bloc/auth_bloc.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/main_page/stories/presentation/widgets/list_stories_widget.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<ProfileBloc>(context).add(const GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FDFF),
      appBar: CustomAppBar(
        title: 'AviaPoint',
        withBack: false,
        withLogo: true,
        actions: [
          Provider.of<AppState>(context, listen: true).isAuthenticated
              ? IconButton(onPressed: () => logOut(context), icon: Icon(Icons.logout))
              : IconButton(
                  onPressed: () => showLogin(
                    context,
                    callback: () => AutoRouter.of(context).navigate(const ProfileNavigationRoute()),
                  ),
                  icon: Icon(Icons.login),
                )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
        children: [
          ListStoriesWidget(),
        ],
      ),

      // body: BlocBuilder<ProfileBloc, ProfileState>(
      //   builder: (context, state) => state.maybeMap(
      //     success: (state) => Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: ListView.builder(
      //             itemCount: state.profile.length,
      //             itemBuilder: (context, index) {
      //               return Column(
      //                 crossAxisAlignment: CrossAxisAlignment.stretch,
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Text(state.profile[index].id.toString()),
      //                   Text(state.profile[index].firstName ?? ''),
      //                   Text(state.profile[index].phone),
      //                 ],
      //               );
      //             })),
      //     orElse: () => const Center(child: CircularProgressIndicator()),
      //   ),
      // ),
    );
  }
}
