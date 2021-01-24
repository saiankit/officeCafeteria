// Packages Import
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

// Providers

import '../../../providers/changeNotifiers/categoriesProvider.dart';
import '../../../providers/changeNotifiers/orderProvider.dart';

//Utilities
import '../../../data/products.dart';
import '../../../utilities/colors.dart';

//Components
import 'components/cartIcon.dart';
import 'components/categoryList.dart';
import 'components/orderSuccessContainer.dart';
import 'components/productList.dart';
import 'components/orderIcon.dart';
import 'components/settingsIcon.dart';

final secureStorage = FlutterSecureStorage();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<String> getUserName() async {
    var name = await secureStorage.read(key: 'name');
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<OrderProvider, CategoriesProvider>(
      builder: (context, orderProvider, categoriesProvider, _) => Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Scaffold(
          backgroundColor: AppColors.homeScreenColor,
          appBar: AppBar(
            backgroundColor: AppColors.homeScreenColor,
            elevation: 0,
            actions: [
              orderProvider.isOrder ? OrderIcon() : Container(),
              CartIcon(),
              SettingsIcon(),
            ],
            title: FutureBuilder(
                future: getUserName(),
                builder: (context, snapshot) {
                  return Text(
                    "Hello, " + snapshot.data.toString(),
                    style: TextStyle(color: Colors.black),
                  );
                }),
            centerTitle: false,
          ),
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                categoriesProvider.isOrderSuccess
                    ? OrderSuccessContainer()
                    : Container(),
                CategoryList(),
                categoriesProvider.categoryIndex == 0
                    ? ProductsList(list: food)
                    : categoriesProvider.categoryIndex == 1
                        ? ProductsList(list: snacks)
                        : categoriesProvider.categoryIndex == 2
                            ? ProductsList(list: bevarages)
                            : ProductsList(list: icecreamsAndCakes)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
