import 'package:http/http.dart';
import 'package:officecafeteria/utilities/endpoints.dart';

Future<String> postUser({
  String name,
  String organization,
  String employeeId,
  int phoneNumber,
  String email,
  String password,
}) async {
  String urlPOSTdonor = API.createUser;
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '''{
    "name": "$name",
    "organization": "$organization",
    "employeeID": "$employeeId",
    "phoneNumber": $phoneNumber,
    "email": "$email",
    "password": "$password",
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
