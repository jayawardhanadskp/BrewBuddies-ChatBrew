import 'package:brewbuddies_chat/utils/app_colors.dart';
import 'package:brewbuddies_chat/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 70, width: double.infinity,),
          Image.asset('assets/HeadNav.png'),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(alignment: Alignment.centerLeft, child: Text('Find the best\nCoffee to your taste', style: AppFonts.large.copyWith(color: Color(0xFF444444)),)),
          ),
        ],
      ),
    );
  }
}