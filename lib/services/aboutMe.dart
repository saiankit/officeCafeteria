import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:officecafeteria/models/serverModels/myInfo.dart';
import 'package:officecafeteria/utilities/endpoints.dart';

final secureStorage = FlutterSecureStorage();
Future<String> aboutMe({String jwtToken}) async {
  Map<String, String> headers = {
    "Content-type": "application/json",
    "x-access-token": "$jwtToken",
  };
  Response response = await get(API.aboutMe, headers: headers);
  String statusCode = response.statusCode.toString();
  MyInfo myInfo = myInfoFromJson(response.body);
  print('User GET request Status Code : ' + statusCode);
  print(myInfo.name);
  if (statusCode == '200') {
    storeUserInformation(myInfo);
    print('User GET successfull');
  } else {
    print('User GET Failed');
  }
  return statusCode;
}

void storeUserInformation(MyInfo myInfo) async {
  await secureStorage.write(key: 'name', value: myInfo.name);
  await secureStorage.write(key: 'organization', value: myInfo.organization);
  await secureStorage.write(key: 'employeeId', value: myInfo.employeeId);
  await secureStorage.write(
      key: 'phoneNumber', value: myInfo.phoneNumber.toString());
  await secureStorage.write(key: 'email', value: myInfo.email);
  await secureStorage.write(key: 'password', value: myInfo.password);
  await secureStorage.write(
      key: 'registrationId', value: myInfo.registrationId);
}
