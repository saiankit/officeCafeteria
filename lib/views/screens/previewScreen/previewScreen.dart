import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: AppColors.previewDetailsColor,
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

class _SubmitUserDataState extends State<SubmitUserData> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        // postUser(
        //   name: widget.name,
        //   organization: widget.organization,
        //   employeeId: widget.employeeId,
        //   phoneNumber: widget.phoneNumber,
        //   email: widget.email,
        // );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
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
    );
  }
}
