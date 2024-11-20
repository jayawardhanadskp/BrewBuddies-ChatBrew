import 'package:brewbuddies_chat/utils/app_colors.dart';
import 'package:brewbuddies_chat/widgets/coffee_small_widget.dart';
import 'package:brewbuddies_chat/widgets/home_widgets.dart';
import 'package:brewbuddies_chat/widgets/tab_content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              const HomeWidgets(),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: AppColors.normalBrown,
                unselectedLabelColor: AppColors.lightGreay,
                indicatorColor: AppColors.normalBrown,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                indicator: const BoxDecoration(
                    color: AppColors.normalBrown, shape: BoxShape.circle),
                indicatorPadding: const EdgeInsets.only(top: 35),
                indicatorWeight: 3,
                tabs: const [
                  Tab(text: 'Espresso'),
                  Tab(text: 'Latte'),
                  Tab(text: 'Cappuccino'),
                  Tab(text: 'Cafetière'),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    TabContent(title: 'Espresso'),
                    TabContent(title: 'Latte'),
                    TabContent(title: 'Cappuccino'),
                    TabContent(title: 'Cafetière'),
                  ],
                ),
              ),
              const HomeWidgetsDown(),
            ],
          ),
          Positioned(
            bottom: 100,
            right: 10,
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightBrown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
