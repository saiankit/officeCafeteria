import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:officecafeteria/providers/userDataProvider.dart';
import 'package:officecafeteria/screens/previewScreen.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:provider/provider.dart';

enum UserData { fullName, organizationName, employeeId, phoneNumber, email }

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
                FlatButton(
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
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
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

class UserDataTextField extends StatefulWidget {
  final int userDataIndex;
  final String title;
  final TextInputType type;

  const UserDataTextField({this.userDataIndex, this.title, this.type});
  @override
  _UserDataTextFieldState createState() => _UserDataTextFieldState();
}

class _UserDataTextFieldState extends State<UserDataTextField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (context, userData, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: TextFormField(
          onChanged: (String value) {
            if (widget.userDataIndex == 0) {
              userData.updateFullName(value);
            } else if (widget.userDataIndex == 1) {
              userData.updateOrganizationName(value);
            } else if (widget.userDataIndex == 2) {
              userData.updateEmployeeIdNumber(value);
            } else if (widget.userDataIndex == 3) {
              userData.updatePhoneNumber(value);
            } else if (widget.userDataIndex == 4) {
              userData.updateEmail(value);
            }
          },
          keyboardType: widget.type,
          decoration: InputDecoration(
            labelText: widget.title,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
