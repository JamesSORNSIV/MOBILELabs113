import 'package:flutter/material.dart';
import '../models/foodmenu.dart'; // ตรวจสอบว่า path ถูกต้อง

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  // ... State variables เหมือนเดิม ...
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _component = '';
  int _price = 0;
  FoodType _foodType = FoodType.steak;
  Foodpic _foodpic = Foodpic.menu1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มข้อมูลเมนูใหม่"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ชื่ออาหาร', border: OutlineInputBorder()),
                  validator: (value) => value!.isEmpty ? "กรุณาป้อนชื่ออาหาร" : null,
                  onSaved: (value) => _name = value!,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ส่วนประกอบสำคัญ', border: OutlineInputBorder()),
                  validator: (value) => value!.isEmpty ? "กรุณาป้อนส่วนประกอบ" : null,
                  onSaved: (value) => _component = value!,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'ราคา', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "กรุณาป้อนราคา";
                    if (int.tryParse(value) == null) return "กรุณาป้อนตัวเลขเท่านั้น";
                    return null;
                  },
                  onSaved: (value) => _price = int.parse(value!),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<FoodType>(
                  value: _foodType,
                  decoration: const InputDecoration(labelText: 'ชนิดอาหาร', border: OutlineInputBorder()),
                  items: FoodType.values.map((foodType) {
                    return DropdownMenuItem(value: foodType, child: Text(foodType.ty));
                  }).toList(),
                  onChanged: (value) => setState(() => _foodType = value!),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<Foodpic>(
                  value: _foodpic,
                  decoration: const InputDecoration(labelText: 'เลือกรูปภาพ', border: OutlineInputBorder()),
                  items: Foodpic.values.map((pic) {
                    return DropdownMenuItem(value: pic, child: Text(pic.namefood));
                  }).toList(),
                  onChanged: (value) => setState(() => _foodpic = value!),
                ),
                const SizedBox(height: 25),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final newFoodItem = FoodMenu(
                        name: _name, type: _foodType.ty, component: _component, price: _price, foodpic: _foodpic);
                      Navigator.pop(context, newFoodItem);
                    }
                  },
                  style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                  child: const Text("บันทึกข้อมูล", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}