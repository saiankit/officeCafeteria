// To parse this JSON data, do
//
//     final myInfo = myInfoFromJson(jsonString);

import 'dart:convert';

MyInfo myInfoFromJson(String str) => MyInfo.fromJson(json.decode(str));

String myInfoToJson(MyInfo data) => json.encode(data.toJson());

class MyInfo {
  MyInfo({
    this.id,
    this.name,
    this.organization,
    this.employeeId,
    this.phoneNumber,
    this.email,
    this.password,
    this.registrationId,
    this.createdAt,
    this.v,
  });

  String id;
  String name;
  String organization;
  String employeeId;
  int phoneNumber;
  String email;
  String password;
  String registrationId;
  DateTime createdAt;
  int v;

  factory MyInfo.fromJson(Map<String, dynamic> json) => MyInfo(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        organization:
            json["organization"] == null ? null : json["organization"],
        employeeId: json["employeeID"] == null ? null : json["employeeID"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        registrationId:
            json["registrationId"] == null ? null : json["registrationId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "organization": organization == null ? null : organization,
        "employeeID": employeeId == null ? null : employeeId,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "registrationId": registrationId == null ? null : registrationId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
