import 'dart:io';
import 'dart:async';
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
  var response = await post(API.registerUser, headers: headers, body: json);
  String statusCode = response.statusCode.toString();
  String jwtToken = response.body[0].toString();
  print('User POST request Status Code : ' + statusCode);
  if (statusCode == '201') {
    print('User POST successfull');
  } else {
    print('User POST Failed');
  }
  return [statusCode, jwtToken];
}
