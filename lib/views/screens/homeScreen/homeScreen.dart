// Packages Import
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import '../../../providers/categoriesProvider.dart';

//Utilities
import '../../../utilities/colors.dart';
import '../../../data/products.dart';

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.orangeColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Order Successful",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "View My Order",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
