import 'package:http/http.dart';

Future<String> postUser({
  String name,
  String organization,
  String employeeId,
  int phoneNumber,
  String email,
}) async {
  String urlPOSTdonor = 'http://localhost:3000/users/';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '''{
    "name": "$name",
    "organization": "$organization",
    "employeeID": "$employeeId",
    "phoneNumber": $phoneNumber,
    "email": "$email"
}''';
  var response = await post(urlPOSTdonor, headers: headers, body: json);
  String statusCode = response.statusCode.toString();
  print('User POST request Status Code : ' + statusCode);
  if (statusCode == '201') {
    print('User POST successfull');
  } else {
    print('User POST Failed');
  }
  return statusCode;
}
