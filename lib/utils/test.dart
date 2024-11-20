import 'package:brewbuddies_chat/utils/app_colors.dart';
import 'package:brewbuddies_chat/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),  // Custom height for header
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find the best\nCoffee to your taste',
                  style: AppFonts.large.copyWith(color: Color(0xFF444444)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
                      Image.asset('assets/HeadNav.png'),

             Text(
                  'Find the best\nCoffee to your taste',
                  style: AppFonts.large.copyWith(color: Color(0xFF444444)),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGreay, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
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
                            style: AppFonts.small.copyWith(color: AppColors.lightGreay),
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
            const SizedBox(height: 40),
            Row(
              children: [
                Text(
                  'Espresso',
                  style: AppFonts.extraSmall.copyWith(
                    color: AppColors.darkBrown,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: AppColors.darkBrown,
              unselectedLabelColor: AppColors.lightGreay,
              indicatorColor: AppColors.darkBrown,
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
