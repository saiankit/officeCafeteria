import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:officecafeteria/providers/userDataProvider.dart';

import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/common/submitButton.dart';
import 'package:officecafeteria/views/screens/previewScreen/previewScreen.dart';
import 'package:provider/provider.dart';

import 'components/userDataTextField.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final snackBar = SnackBar(content: Text('All fields are compulsory'));
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeScreenColor,
      body: Builder(
        builder: (context) => Consumer<UserDataProvider>(
          builder: (context, userData, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserDataTextField(
                title: "Organization Name",
                type: TextInputType.name,
                userDataIndex: 1,
              ),
              UserDataTextField(
                title: "Employee ID Number",
                type: TextInputType.name,
                userDataIndex: 2,
              ),
              UserDataTextField(
                title: "Phone Number",
                type: TextInputType.number,
                userDataIndex: 3,
              ),
              FlatButton(
                onPressed: () {
                  getImage(userData);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Color(0xffbbf1fa),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: const Text("Upload your ID Card"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              userData.idCardImage == null
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        children: [
                          Text("ID Card Uploaded"),
                        ],
                      ),
                    ),
              SubmitButton(
                label: "SUBMIT",
                onPressed: () async {
                  if (userData.oraganisationName != null &&
                      userData.phoneNumber != null &&
                      userData.employeeId != null &&
                      userData.idCardImage != null) {
                    Future.delayed(Duration.zero, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PreviewScreen(),
                        ),
                      );
                    });
                  } else {
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getImage(UserDataProvider userData) async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 10);
    userData.updateImage(File(pickedFile.path));
  }
}
