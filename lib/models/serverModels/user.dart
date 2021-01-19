// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.name,
        this.organization,
        this.employeeId,
        this.phoneNumber,
        this.email,
    });

    String name;
    String organization;
    String employeeId;
    int phoneNumber;
    String email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        organization: json["organization"] == null ? null : json["organization"],
        employeeId: json["employeeID"] == null ? null : json["employeeID"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        email: json["email"] == null ? null : json["email"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "organization": organization == null ? null : organization,
        "employeeID": employeeId == null ? null : employeeId,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "email": email == null ? null : email,
    };
}
