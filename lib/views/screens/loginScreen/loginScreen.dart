import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:officecafeteria/providers/changeNotifiers/loadingProvider.dart';
import 'package:officecafeteria/providers/changeNotifiers/userDataProvider.dart';
import 'package:officecafeteria/services/aboutMe.dart';
import 'package:officecafeteria/services/loginUser.dart';
import 'package:officecafeteria/views/common/loadingWidget.dart';
import '../userRegistration/registerUserScreen.dart';
import 'package:provider/provider.dart';
import 'package:officecafeteria/utilities/colors.dart';
import '../../common/submitButton.dart';
import '../homeScreen/homeScreen.dart';
import '../userRegistration/components/userDataTextField.dart';

final secureStorage = FlutterSecureStorage();

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordSnackBar =
      SnackBar(content: Text('Please enter a valid password'));
  final emailSnackBar = SnackBar(content: Text('Please enter a valid e-mail'));
  saveJwt(String token) async {
    await secureStorage.write(key: 'jwt', value: token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeScreenColor,
      appBar: AppBar(
        backgroundColor: AppColors.homeScreenColor,
        elevation: 0,
      ),
      body: Builder(
        builder: (context) => Consumer2<UserDataProvider, LoadingProvider>(
          builder: (context, userData, loadingProvider, _) => Stack(
            children: [
              loadingProvider.loginLoading
                  ? loginLoading()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Office cafeteria",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(
                            height: 100.0,
                            width: 100.0,
                            child: SvgPicture.asset("assets/coffee-cup.svg")),
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
                            if (userData.email == null) {
                              Scaffold.of(context).showSnackBar(emailSnackBar);
                            } else if (userData.password == null) {
                              Scaffold.of(context)
                                  .showSnackBar(passwordSnackBar);
                            } else {
                              loadingProvider.toggleLoginLoading();
                              var loginResponse = await loginUser(
                                  email: userData.email,
                                  password: userData.password);

                              // Save the JWT Token to persist the user
                              var token = loginResponse[0];
                              saveJwt(token);

                              var aboutMyInfo = await aboutMe(jwtToken: token);
                              // Verifying the POST Status Code and routing user to HomeScreen
                              var statusCode = loginResponse[1];
                              if (statusCode == '201') {
                                if (aboutMyInfo[0] == '200') {
                                  loadingProvider.toggleLoginLoading();

                                  Future.delayed(Duration.zero, () {
                                    Navigator.pop(context);
                                  });
                                  Future.delayed(Duration.zero, () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  });
                                }
                              }
                            }
                          },
                        ),
                        // Register Button to Route to Register Screen
                        SubmitButton(
                          flip: true,
                          label: "REGISTER",
                          onPressed: () {
                            Future.delayed(
                              Duration.zero,
                              () {
                                Navigator.pop(context);
                              },
                            );
                            Future.delayed(
                              Duration.zero,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterUser(),
                                  ),
                                );
                              },
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
