import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        Image.asset(
          'assets/images/1.jpg',
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 15),
        Image.asset(
          'assets/images/2.jpg',
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 15),
        Image.asset(
          'assets/images/3.jpg',
          width: 200,
          height: 200,
        ),
      ],
    );
  }
}