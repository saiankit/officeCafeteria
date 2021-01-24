import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:officecafeteria/views/screens/homeScreen/homeScreen.dart';
import 'package:officecafeteria/views/screens/loginScreen/loginScreen.dart';

final secureStorage = FlutterSecureStorage();

class CustomAuthWrapper extends StatefulWidget {
  @override
  _CustomAuthWrapperState createState() => _CustomAuthWrapperState();
}

class _CustomAuthWrapperState extends State<CustomAuthWrapper> {
  Future<String> get getJwt async {
    var jwt = await secureStorage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getJwt,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data != "") {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
