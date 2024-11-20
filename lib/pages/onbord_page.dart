import 'package:brewbuddies_chat/pages/home_page.dart';
import 'package:brewbuddies_chat/utils/app_colors.dart';
import 'package:brewbuddies_chat/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class OnbordPage extends StatelessWidget {
  const OnbordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.lightBrown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/onbord.png'),
            // const SizedBox(height: 40),
            Column(
              children: [
                Text(
                  'Stay Focused',
                  style: AppFonts.large,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Get the cup filled of your choice to stay focused and awake. Diffrent type of coffee menu, hot lottee cappucino',
                    style: AppFonts.extraSmall.copyWith(
                      color: const Color(0xFF444444),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // const SizedBox(
                //   height: 60,
                // ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.normalBrown,
                  shadowColor: AppColors.normalBrown,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fixedSize: const Size(160, 60)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dive In',
                    style: AppFonts.small.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
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
