import 'package:brewbuddies_chat/utils/app_fonts.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class HomeWidgets extends StatelessWidget {
  const HomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}