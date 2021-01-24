import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:officecafeteria/utilities/endpoints.dart';

Future<List<String>> registerUser({
  String name,
  String organization,
  String employeeId,
  int phoneNumber,
  String email,
  String password,
}) async {
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '''{
    "name": "$name",
    "organization": "$organization",
    "employeeID": "$employeeId",
    "phoneNumber": $phoneNumber,
    "email": "$email",
    "password": "$password"
  }''';
  Response response =
      await post(API.registerUser, headers: headers, body: json);

  RegistrationResponse mapped = registrationResponseFromJson(response.body);

  String statusCode = response.statusCode.toString();
  print('User POST request Status Code : ' + statusCode);
  if (statusCode == '201') {
    print('User POST successfull');
  } else {
    print('User POST Failed');
  }
  return [mapped.token, statusCode];
}

RegistrationResponse registrationResponseFromJson(String str) =>
    RegistrationResponse.fromJson(json.decode(str));

String registrationResponseToJson(RegistrationResponse data) =>
    json.encode(data.toJson());

class RegistrationResponse {
  RegistrationResponse({
    this.token,
  });

  String token;

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      RegistrationResponse(
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
      };
}
