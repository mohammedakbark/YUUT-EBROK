import 'package:hive_flutter/adapters.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(0)
  String cartId;
  @HiveField(1)
  String productId;
  @HiveField(2)
  double quantity;
   @HiveField(3)
  String size;

  CartModel(
      {
        required this.size,
        required this.cartId, required this.productId, required this.quantity});

  Map<String, dynamic> toJson() =>
      {'cartId': cartId, 'productId': productId, 'quantity': quantity,'size':size};

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    size:json['size'],
      cartId: json["cartId"],
      productId: json["productId"],
      quantity: json["quantity"]);
}
