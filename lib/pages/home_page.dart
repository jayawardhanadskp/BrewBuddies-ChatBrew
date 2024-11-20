import 'package:brewbuddies_chat/utils/app_colors.dart';
import 'package:brewbuddies_chat/utils/app_fonts.dart';
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
      body: Column(
        children: [
          const SizedBox(height: 70),
          Image.asset('assets/HeadNav.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Find the best\nCoffee to your taste',
                    style: AppFonts.large.copyWith(color: Color(0xFF444444)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.lightGreay, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/Search.png',
                                height: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Find your coffee...',
                                style: AppFonts.small
                                    .copyWith(color: AppColors.lightGreay),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/sort.png',
                      height: 55,
                    )
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
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
              children: [
                _buildTabContent('Espresso'),
                _buildTabContent('Latte'),
                _buildTabContent('Cappuccino'),
                _buildTabContent('Cafetière'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String title) {
    return Center(
      child: Text(
        '$title section',
        style: AppFonts.small.copyWith(color: AppColors.darkBrown),
      ),
    );
  }
}
