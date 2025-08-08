import 'package:flutter/material.dart';
import '../models/foodmenu.dart';
import 'addform.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final List<FoodMenu> foodMenus = [
    FoodMenu(name: "สเต็กหมู", type: "สเต็ก", component: "สันคอหมู, มันบด", price: 299, foodpic: Foodpic.menu3),
    FoodMenu(name: "สเต็กเนื้อ", type: "สเต็ก", component: "เนื้อสันใน", price: 389, foodpic: Foodpic.menu4),
    FoodMenu(name: "แฮมเบอร์เกอร์", type: "จานด่วน", component: "ขนมปัง, เนื้อ", price: 189, foodpic: Foodpic.menu5),
  ];

  Color getBackgroundColor(String type) {
    switch (type) {
      case 'สเต็ก': return Colors.orangeAccent.shade100;
      case 'จานด่วน': return Colors.red.shade100;
      default: return Colors.grey.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("รายการอาหาร"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: foodMenus.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: getBackgroundColor(foodMenus[index].type),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(foodMenus[index].name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text("ประเภท: ${foodMenus[index].type}", style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
                      const SizedBox(height: 10),
                      Text("ราคา: ${foodMenus[index].price} บาท", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(foodMenus[index].foodpic.image, width: 100, height: 100, fit: BoxFit.cover),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final newFood = await Navigator.push<FoodMenu>(
            context,
            MaterialPageRoute(builder: (context) => const AddForm()),
          );

          if (newFood != null) {
            setState(() {
              foodMenus.add(newFood);
            });
          }
        },
      ),
    );
  }
}