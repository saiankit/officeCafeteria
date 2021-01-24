import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:officecafeteria/providers/changeNotifiers/userDataProvider.dart';

import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/common/submitButton.dart';
import 'package:officecafeteria/views/screens/loginScreen/loginScreen.dart';
import 'package:officecafeteria/views/screens/userRegistration/userDetails.dart';
import 'package:provider/provider.dart';

import 'components/userDataTextField.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final snackBar = SnackBar(content: Text('All fields are compulsory'));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Scaffold(
        backgroundColor: AppColors.homeScreenColor,
        body: Builder(
          builder: (context) => Consumer<UserDataProvider>(
            builder: (context, userData, _) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: SvgPicture.asset("assets/food-delivery.svg"),
                ),
                UserDataTextField(
                  title: "Full Name",
                  type: TextInputType.name,
                  userDataIndex: 0,
                ),
                UserDataTextField(
                  title: "Email Address",
                  type: TextInputType.emailAddress,
                  userDataIndex: 4,
                ),
                UserDataTextField(
                  isObscure: true,
                  title: "Password",
                  type: TextInputType.emailAddress,
                  userDataIndex: 5,
                ),
                SubmitButton(
                  label: "NEXT",
                  onPressed: () {
                    if (userData.fullName != null &&
                        userData.email != null &&
                        userData.password != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetails(),
                        ),
                      );
                    } else {
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
                SubmitButton(
                  flip: true,
                  label: "LOGIN",
                  onPressed: () {
                    Future.delayed(Duration.zero, () {
                      Navigator.pop(context);
                    });
                    Future.delayed(Duration.zero, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
