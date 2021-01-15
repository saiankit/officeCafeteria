import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:officecafeteria/providers/userDataProvider.dart';

import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/common/submitButton.dart';
import 'package:officecafeteria/views/screens/loginScreen/loginScreen.dart';
import 'package:officecafeteria/views/screens/previewScreen/previewScreen.dart';
import 'package:officecafeteria/views/screens/userRegistration/userDetails.dart';
import 'package:provider/provider.dart';

import 'components/userDataTextField.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final snackBar = SnackBar(content: Text('All fields are compulsory'));
  File _image;
  final picker = ImagePicker();
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
          builder: (context, userData, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
