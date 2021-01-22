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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.homeScreenColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.secondaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Body(),
    );
  }
}
