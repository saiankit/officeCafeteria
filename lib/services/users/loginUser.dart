import 'package:http/http.dart';
import 'package:officecafeteria/utilities/endpoints.dart';
import 'dart:convert';

Future<String> loginUser({
  String email,
  String password,
}) async {
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '''
  {
    "email": "$email",
    "password": "$password"
  }
''';
  var response = await post(API.loginUser, headers: headers, body: json);
  String statusCode = response.statusCode.toString();
  print(loginResponseFromJson(response.body).token);
  print('User POST request Status Code : ' + statusCode);
  if (statusCode == '201') {
    print('User POST successfull');
  } else {
    print('User POST Failed');
  }
  return statusCode;
}

// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.token,
  });

  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
      };
}
