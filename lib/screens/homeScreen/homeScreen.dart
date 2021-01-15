// Packages Import
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import '../../providers/categoriesProvider.dart';

//Utilities
import '../../utilities/colors.dart';

//Components
import 'components/cartIcon.dart';
import 'components/categoryList.dart';
import 'components/productList.dart';

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
          CartIcon(),
        ],
        title: Text(
          "Hello, Sai Ankit",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        bottom: false,
        child: Consumer<CategoriesProvider>(
          builder: (context, categories, _) => Column(
            children: [
              CategoryList(),
              categories.categoryIndex == 0
                  ? ProductsList(list: food)
                  : categories.categoryIndex == 1
                      ? ProductsList(list: snacks)
                      : categories.categoryIndex == 2
                          ? ProductsList(list: bevarages)
                          : ProductsList(list: icecreamsAndCakes)
            ],
          ),
        ),
      ),
    );
  }
}
