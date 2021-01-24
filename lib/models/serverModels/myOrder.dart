// To parse this JSON data, do
//
//     final myOrder = myOrderFromJson(jsonString);

import 'dart:convert';

MyOrder myOrderFromJson(String str) => MyOrder.fromJson(json.decode(str));

String myOrderToJson(MyOrder data) => json.encode(data.toJson());

class MyOrder {
  MyOrder({
    this.orderProducts,
    this.id,
    this.createdAt,
    this.registrationId,
    this.orderId,
    this.takeAwayTime,
  });

  List<OrderProduct> orderProducts;
  String id;
  DateTime createdAt;
  String registrationId;
  String orderId;
  String takeAwayTime;

  factory MyOrder.fromJson(Map<String, dynamic> json) => MyOrder(
        orderProducts: json["orderProducts"] == null
            ? null
            : List<OrderProduct>.from(
                json["orderProducts"].map((x) => OrderProduct.fromJson(x))),
        id: json["_id"] == null ? null : json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        registrationId:
            json["registrationId"] == null ? null : json["registrationId"],
        orderId: json["orderId"] == null ? null : json["orderId"],
        takeAwayTime:
            json["takeAwayTime"] == null ? null : json["takeAwayTime"],
      );

  Map<String, dynamic> toJson() => {
        "orderProducts": orderProducts == null
            ? null
            : List<dynamic>.from(orderProducts.map((x) => x.toJson())),
        "_id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "registrationId": registrationId == null ? null : registrationId,
        "orderId": orderId == null ? null : orderId,
        "takeAwayTime": takeAwayTime == null ? null : takeAwayTime,
      };
}

class OrderProduct {
  OrderProduct({
    this.id,
    this.price,
    this.title,
    this.description,
    this.count,
    this.image,
  });

  int id;
  int price;
  String title;
  String description;
  int count;
  String image;

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        id: json["id"] == null ? null : json["id"],
        price: json["price"] == null ? null : json["price"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        count: json["count"] == null ? null : json["count"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "price": price == null ? null : price,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "count": count == null ? null : count,
        "image": image == null ? null : image,
      };
}
