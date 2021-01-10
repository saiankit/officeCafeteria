import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:officecafeteria/utilities/colors.dart';

class PreviewScreen extends StatefulWidget {
  final String name;
  final String organization;
  final String employeeId;
  final int phoneNumber;
  final String email;
  final String imagePath;

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
      appBar: AppBar(
        title: Text('Registration Pass'),
      ),
      body: Container(
        color: Color(0xffd9eef1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.imagePath == null
                    ? Container()
                    : Image.asset(widget.imagePath),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color(0xffff4646),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    height: size.height * 0.4,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40.0,
                                    child: SvgPicture.asset(
                                        'assets/profilePic.svg'),
                                  ),
                                  Text(
                                    "John Snow",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '2019AAPS0331H',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '7093732862',
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
                )
              ],
            ),
          ],
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
