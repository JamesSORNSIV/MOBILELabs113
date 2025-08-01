import 'package:flutter/material.dart';
import '../models/foodmenu.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  // ข้อมูลเมนูอาหารทั้งหมด
  final List<FoodMenu> foodMenus = [
    FoodMenu(name: "สเต็กหมู", type: "สเต็ก", component: "สันคอหมู, มันบด, สลัด", price: 299, foodpic: Foodpic.menu1),
    FoodMenu(name: "สเต็กเนื้อ", type: "สเต็ก", component: "เนื้อสันใน, เฟรนช์ฟรายส์", price: 389, foodpic: Foodpic.menu2),
    FoodMenu(name: "แฮมเบอร์เกอร์", type: "จานด่วน", component: "ขนมปัง, เนื้อบด, ชีส, ผัก", price: 189, foodpic: Foodpic.menu3),
  ];

  // ฟังก์ชันสำหรับคืนค่าสีตามประเภทอาหาร
  Color getBackgroundColor(String type) {
    switch (type) {
      case 'สเต็ก':
        return Colors.orangeAccent.shade100;
      case 'จานด่วน':
        return Colors.red.shade100;
      case 'ก๋วยเตี๋ยว':
        return Colors.yellow.shade200;
      default:
        return Colors.grey.shade200;
    }
  }

  // ส่วนบนเหมือนเดิม ...

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodMenus[index].name,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "ประเภทอาหาร: ${foodMenus[index].type}",
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "ราคา: ${foodMenus[index].price} บาท",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  foodMenus[index].foodpic.image, // แก้ไขให้ดึง path รูปจาก enum
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        );
      },
    );
  }
} // <-- ปีกกาปิดของ class _ItemState