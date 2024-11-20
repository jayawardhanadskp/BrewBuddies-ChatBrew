import 'package:brewbuddies_chat/widgets/coffee_small_widget.dart';
import 'package:flutter/material.dart';

class TabContent extends StatelessWidget {
  final String title;
  const TabContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoffeeSmallWidget(
              image: 'assets/espresso-cup-with-coffee-beans.png',
              name: 'Espresso',
              type: 'with Oa t Milk',
              price: '4.99'),
          CoffeeSmallWidget(
              image: 'assets/Creamy.png',
              name: 'Espresso',
              type: 'with Milk',
              price: '4.29'),
        ],
      ),
    );
  }
}
