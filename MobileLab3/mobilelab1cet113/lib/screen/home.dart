import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // แก้ไข ID ตามภาพล่าสุด
          title: const Text("CET App ID:113"),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: const Home(),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/images/1.png', 
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 8), 
              const Text(
                'Spaghetti',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 20), 

          Column(
            children: [
              Image.asset(
                'assets/images/2.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 8),
              const Text(
                'Breakfast Set',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 20), 

          Column(
            children: [
              Image.asset(
                'assets/images/3.png', 
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 8),
              const Text(
                'Fast Food Set',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}