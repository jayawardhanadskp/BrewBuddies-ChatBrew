import 'package:brewbuddies_chat/utils/app_colors.dart';
import 'package:brewbuddies_chat/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class CoffeeSmallWidget extends StatelessWidget {
  final String image;
  final String name;
  final String type;
  final String price;
  const CoffeeSmallWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.price, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 200,
        height: 235,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        name,
                        style:
                            AppFonts.small.copyWith(color: AppColors.darkGreay),
                      ),
                      Text(
                        type,
                        style: AppFonts.extraSmall
                            .copyWith(color: AppColors.lightGreay),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '\$ ',
                          style: AppFonts.small.copyWith(
                              color: AppColors.normalBrown,
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                              text: price,
                              style: AppFonts.small
                                  .copyWith(color: AppColors.darkGreay),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: AppColors.normalBrown,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(25)),
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 32,
                      )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeWidgetsDown extends StatelessWidget {
  const HomeWidgetsDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                      padding: const EdgeInsets.all(10),
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
    );
  }
}
