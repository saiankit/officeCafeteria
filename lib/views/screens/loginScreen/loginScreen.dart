import 'package:flutter/material.dart';
import 'package:officecafeteria/services/users/loginUser.dart';
import '../userRegistration/registerUserScreen.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:officecafeteria/utilities/colors.dart';
import '../../../providers/userDataProvider.dart';
import '../../common/submitButton.dart';
import '../homeScreen/homeScreen.dart';
import '../userRegistration/components/userDataTextField.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final snackBar = SnackBar(content: Text('All fields are compulsory'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeScreenColor,
      appBar: AppBar(
        title: Text("Office Cafetaria"),
        centerTitle: false,
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
      ),
      body: Builder(
        builder: (context) => Consumer<UserDataProvider>(
          builder: (context, userData, _) => Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserDataTextField(
                    title: "Email Address",
                    type: TextInputType.emailAddress,
                    userDataIndex: 4,
                  ),
                  UserDataTextField(
                    title: "Password",
                    type: TextInputType.emailAddress,
                    userDataIndex: 5,
                    isObscure: true,
                  ),
                  SubmitButton(
                    label: "LOGIN",
                    onPressed: () async {
                      if (userData.email != null && userData.password != null) {
                        var statusCode = await loginUser(
                            email: userData.email, password: userData.password);
                        if (statusCode == '201') {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      } else {
                        Scaffold.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                  SubmitButton(
                    flip: true,
                    label: "REGISTER",
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterUser(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
