import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:officecafeteria/screens/homeScreen.dart';
import 'package:officecafeteria/utilities/colors.dart';

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.homeScreenColor,
      appBar: AppBar(
        title: Text('Registration Pass'),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: AppColors.orangeColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          height: size.height * 0.25,
                          width: size.width * 0.75,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 12.0,
                                    width: 12.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 40.0,
                                          child: SvgPicture.asset(
                                              'assets/profilePic.svg'),
                                        ),
                                        Text(
                                          widget.name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          widget.employeeId,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          widget.organization,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: AppColors.orangeColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          height: size.height * 0.1,
                          width: size.width * 0.75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.phoneNumber.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.email,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      widget.imagePath == null
                          ? Container(
                              height: 200.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: AppColors.orangeColor,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            )
                          : SizedBox(
                              height: 300.0,
                              width: 300.0,
                              child: Image.file(widget.imagePath),
                            ),
                    ],
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
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

// postUser(
//     name: name,
//     organization: oraganisationName,
//     employeeId: employeeID,
//     phoneNumber: mobileNumber,
//     email: email);
