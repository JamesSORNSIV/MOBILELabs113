// ใช้ Enhanced Enum เพื่อเก็บ path ของรูปภาพไว้ในตัว enum เอง
enum Foodpic {
  menu1(image: "assets/images/1.png"),
  menu2(image: "assets/images/2.png"),
  menu3(image: "assets/images/3.png"),
  menu4(image: "assets/images/4.png"),
  menu5(image: "assets/images/5.png"),
  menu6(image: "assets/images/6.png"),
  menu7(image: "assets/images/7.png");

  // Constructor และ Property ของ enum
  const Foodpic({required this.image});
  final String image;
}

// Data Model Class
class FoodMenu {
  final String name;
  final String type;
  final String component;
  final int price;
  final Foodpic foodpic;

  FoodMenu({
    required this.name,
    required this.type,
    required this.component,
    required this.price,
    required this.foodpic,
  });
}