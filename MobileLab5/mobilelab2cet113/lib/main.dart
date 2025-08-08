import 'package:flutter/material.dart';
import 'package:mobilelab2cet113/screen/item.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Menu App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const ItemPage(), 
    );
  }
}