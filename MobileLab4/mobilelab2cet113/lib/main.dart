import 'package:flutter/material.dart';
import 'package:mobilelab2cet113/screen/item.dart'; // แก้ชื่อโปรเจกต์ให้ตรงกับของคุณ

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("CET App ID:113"),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: const Item(),
      ),
    );
  }
}