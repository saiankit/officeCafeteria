// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'package:officecafeteria/models/cartItem.dart';

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    this.registrationId,
    this.orderProducts,
  });

  String registrationId;
  List<CartItem> orderProducts;

  Map<String, dynamic> toJson() => {
        "registrationId": registrationId == null ? null : registrationId,
        "orderProducts": orderProducts == null
            ? null
            : List<dynamic>.from(orderProducts.map((x) => x.toJson())),
      };
}
