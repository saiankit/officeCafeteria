import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:officecafeteria/providers/userDataProvider.dart';
import 'package:officecafeteria/screens/previewScreen/previewScreen.dart';
import 'package:officecafeteria/screens/userRegistration/components/submitButton.dart';
import 'package:officecafeteria/screens/userRegistration/components/userDataTextField.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:provider/provider.dart';

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
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) => Consumer<UserDataProvider>(
            builder: (context, userData, _) => Column(
              children: [
                UserDataTextField(
                  title: "Full Name",
                  type: TextInputType.name,
                  userDataIndex: 0,
                ),
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
                UserDataTextField(
                  title: "Email Address",
                  type: TextInputType.emailAddress,
                  userDataIndex: 4,
                ),
                FlatButton(
                  onPressed: () {
                    getImage();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        color: AppColors.skinColor,
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
                _image == null
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
                  onPressed: () {
                    if (userData.fullName != null &&
                        userData.oraganisationName != null &&
                        userData.phoneNumber != null &&
                        userData.employeeId != null &&
                        userData.email != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PreviewScreen(
                            name: userData.fullName,
                            organization: userData.oraganisationName,
                            phoneNumber: userData.phoneNumber,
                            email: userData.email,
                            employeeId: userData.employeeId,
                            imagePath: _image == null ? "" : _image,
                          ),
                        ),
                      );
                    } else {
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ],
            ),
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
