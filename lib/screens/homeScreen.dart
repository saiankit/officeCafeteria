import 'package:flutter/material.dart';
import '../utilities/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeScreenColor,
      appBar: AppBar(
        backgroundColor: AppColors.homeScreenColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: null,
          ),
        ],
        title: Text(
          "Hello Sai Ankit",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
