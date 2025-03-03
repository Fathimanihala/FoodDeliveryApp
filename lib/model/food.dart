import 'dart:ffi';

class Food {
  final String name;              //cheese burger
  final String description;      // a burger full of cheese
  final String imagepath;          //lib/images
  final double price;             //4.9
  final FoodCategory category;    //burger
  List<Addon> availableAddons;    //{ extra cheese sauce}

  Food( {
    required this.name,
    required this.description,
    required this.imagepath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}
enum FoodCategory {
  burger,
  salads,
  side,
  desert,
  drinks,
}

class Addon {
  String name;
  double price;

  Addon({required this.name, required this.price});
}