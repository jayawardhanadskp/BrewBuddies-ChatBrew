import 'package:brewbuddies_chat/utils/app_colors.dart';
import 'package:brewbuddies_chat/utils/app_fonts.dart';
import 'package:brewbuddies_chat/widgets/coffee_small_widget.dart';
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
                        style: AppFonts.large.copyWith(color: AppColors.darkGreay),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.lightGreay, width: 1),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/Search.png', height: 20),
                                  const SizedBox(width: 10),
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
                        Image.asset('assets/sort.png', height: 55)
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
                    TabContent(title:'Espresso'),
                    TabContent(title:'Latte'),
                    TabContent(title:'Cappuccino'),
                    TabContent(title:'Cafetière'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Special for you',
                        style: AppFonts.large.copyWith(color: AppColors.darkGreay),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 150,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.normalBrown,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 180,
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                'assets/Creamy.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              'Specially mixed and brewed whivh you must try!',
                              style: AppFonts.small.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  
}
