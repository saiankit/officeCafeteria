import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:officecafeteria/screens/previewScreen.dart';
import 'package:officecafeteria/services/users/postUser.dart';
import 'package:officecafeteria/utilities/colors.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController organisationNameController = TextEditingController();
  TextEditingController employeeIDController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailNumberController = TextEditingController();
  File _image;
  final picker = ImagePicker();
  String name;
  String oraganisationName;
  String employeeID;
  int mobileNumber;
  String email;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
        ),
        body: Container(
          color: AppColors.primaryColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: TextFormField(
                  onChanged: (String value) {
                    name = value;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: TextFormField(
                  onChanged: (String value) {
                    oraganisationName = value;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Organization Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: TextFormField(
                  onChanged: (String value) {
                    employeeID = value;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Employee ID Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: TextFormField(
                  onChanged: (String value) {
                    mobileNumber = int.parse(value);
                    print(mobileNumber);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: TextFormField(
                  onChanged: (String value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  getImage();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Text("Upload your ID Card"),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewScreen(
                        name: name,
                        organization: oraganisationName,
                        phoneNumber: mobileNumber,
                        email: email,
                        employeeId: employeeID,
                        imagePath: _image == null ? "" : _image.path,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
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
