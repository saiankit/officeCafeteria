import 'package:flutter/material.dart';
import 'package:officecafeteria/utilities/colors.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeScreenColor,
      appBar: AppBar(
        backgroundColor: AppColors.homeScreenColor,
      ),
    );
  }
}
