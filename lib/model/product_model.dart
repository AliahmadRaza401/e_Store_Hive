import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  String price;

  Product(
      {required this.name,
      required this.image,
      required this.date,
      required this.price});
}


@HiveType(typeId: 1)
class CartModel {

  
  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  String price;

  @HiveField(4)
  String quantity;

  CartModel(
      {required this.name,
      required this.image,
      required this.date,
      required this.price,
      required this.quantity,
      });
}
