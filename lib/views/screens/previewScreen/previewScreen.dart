import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:officecafeteria/services/aboutMe.dart';
import 'package:officecafeteria/services/registerUser.dart';
import 'package:officecafeteria/views/common/submitButton.dart';
import 'package:officecafeteria/views/screens/userRegistration/registerUserScreen.dart';
import 'package:provider/provider.dart';

import '../../../providers/userDataProvider.dart';
import '../homeScreen/homeScreen.dart';
import '../../../utilities/colors.dart';

class PreviewScreen extends StatefulWidget {
  final String name;
  final String organization;
  final String employeeId;
  final int phoneNumber;
  final String email;
  final File imagePath;

  const PreviewScreen({
    this.name,
    this.organization,
    this.employeeId,
    this.phoneNumber,
    this.email,
    this.imagePath,
  });
  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeScreenColor,
      appBar: AppBar(
        title: Text('Preview Details'),
        backgroundColor: AppColors.secondaryColor,
        centerTitle: false,
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: [
              ProfileDetails(
                label: widget.name,
                icon: "assets/user.svg",
              ),
              ProfileDetails(
                label: widget.employeeId,
                icon: "assets/touch.svg",
              ),
              ProfileDetails(
                label: widget.organization,
                icon: "assets/group.svg",
              ),
              ProfileDetails(
                label: widget.phoneNumber.toString(),
                icon: "assets/phone-call.svg",
              ),
              ProfileDetails(
                label: widget.email,
                icon: "assets/email.svg",
              ),
              widget.imagePath == null
                  ? Container()
                  : SizedBox(
                      height: 300.0,
                      width: 300.0,
                      child: Image.file(
                        widget.imagePath,
                      ),
                    ),
              SubmitUserData(
                name: widget.name,
                organization: widget.organization,
                employeeId: widget.employeeId,
                phoneNumber: widget.phoneNumber,
                email: widget.email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final String label;
  final String icon;

  const ProfileDetails({Key key, this.label, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15),
        ),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onPressed: () {},
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                color: AppColors.secondaryColor,
                width: 22,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  this.label,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitUserData extends StatefulWidget {
  final String name;
  final String organization;
  final String employeeId;
  final int phoneNumber;
  final String email;
  final File imagePath;

  const SubmitUserData(
      {this.name,
      this.organization,
      this.employeeId,
      this.phoneNumber,
      this.email,
      this.imagePath});
  @override
  _SubmitUserDataState createState() => _SubmitUserDataState();
}

final secureStorage = FlutterSecureStorage();

class _SubmitUserDataState extends State<SubmitUserData> {
  saveJwt(String token) async {
    await secureStorage.write(key: 'jwt', value: token);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (context, userData, _) => SubmitButton(
        label: "REGISTER",
        onPressed: () async {
          var response = await registerUser(
            name: userData.fullName,
            organization: userData.oraganisationName,
            employeeId: userData.employeeId,
            phoneNumber: userData.phoneNumber,
            email: userData.email,
            password: userData.password,
          );
          if (response[0] == "201") {
            saveJwt(response[1]);
            var aboutMyInfo = await aboutMe(jwtToken: response[1]);
            // Popping out the Preview Screen
            Future.delayed(Duration.zero, () {
              Navigator.pop(context);
            });
            // Popping out the User Details Screen
            Future.delayed(Duration.zero, () {
              Navigator.pop(context);
            });
            // Popping out the Register Screen
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
        },
      ),
    );
  }
}
