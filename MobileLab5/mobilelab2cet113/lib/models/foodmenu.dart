enum Foodpic {
  menu1(namefood: "สุกี้", image: "assets/images/1.png"),
  menu2(namefood: "สลัดรวม", image: "assets/images/2.png"),
  menu3(namefood: "สเต็กหมู", image: "assets/images/3.png"),
  menu4(namefood: "สเต็กเนื้อ", image: "assets/images/4.png"),
  menu5(namefood: "แฮมเบอร์เกอร์", image: "assets/images/5.png"),
  menu6(namefood: "พิซซ่า", image: "assets/images/6.png"),
  menu7(namefood: "ก๋วยเตี๋ยว", image: "assets/images/7.png");

  const Foodpic({
    required this.image,
    required this.namefood,
  });
  final String image;
  final String namefood;
}

enum FoodType {
  steak(ty: "สเต็ก"),
  fastfood(ty: "จานด่วน"),
  noodle(ty: "ก๋วยเตี๋ยว"),
  healthy(ty: "สุขภาพ");

  const FoodType({required this.ty});
  final String ty;
}

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