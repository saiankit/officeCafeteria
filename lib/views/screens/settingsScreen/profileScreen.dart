import 'package:flutter/material.dart';
import 'package:officecafeteria/views/screens/settingsScreen/body.dart';

import '../../../utilities/colors.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Scaffold(
        backgroundColor: AppColors.homeScreenColor,
        appBar: AppBar(
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: AppColors.homeScreenColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.secondaryColor,
            ),
            onPressed: () {
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
            },
          ),
          elevation: 0,
          centerTitle: false,
        ),
        body: Body(),
      ),
    );
  }
}
