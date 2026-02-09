import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/blog/presentation/pages/blog_screen.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/news/presentation/pages/news_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Журнал',
        withBack: false,
        withProfile: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF0A6EFA),
          unselectedLabelColor: const Color(0xFF9CA5AF),
          dividerColor: Colors.transparent,
          labelStyle: AppStyles.bold14s,
          unselectedLabelStyle: AppStyles.regular14s,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.5, color: Color(0xFF0A6EFA)),
            insets: EdgeInsets.fromLTRB(8, 0, 8, 2),
          ),
          tabs: const [
            Tab(text: 'АвиаЖурнал'),
            Tab(text: 'АвиаНовости'),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      body: TabBarView(
        controller: _tabController,
        children: const [
          // Блог и Новости уже сами управляют своим состоянием и навигацией
          BlogScreen(),
          NewsScreen(),
        ],
      ),
    );
  }
}
