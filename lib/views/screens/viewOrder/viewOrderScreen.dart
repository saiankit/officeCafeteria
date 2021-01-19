import 'package:flutter/material.dart';
import 'package:officecafeteria/utilities/colors.dart';

class ViewOrderScreen extends StatefulWidget {
  @override
  _ViewOrderScreenState createState() => _ViewOrderScreenState();
}

class _ViewOrderScreenState extends State<ViewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeScreenColor,
      appBar: AppBar(
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
        title: Text(
          "My Order",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColors.homeScreenColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Spot at",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "Office Cafetaria",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
