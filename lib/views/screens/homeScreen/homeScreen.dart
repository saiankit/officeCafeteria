// Packages Import
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:officecafeteria/views/screens/homeScreen/components/settingsIcon.dart';
import 'package:provider/provider.dart';

// Providers
import '../../../providers/categoriesProvider.dart';

//Utilities
import '../../../data/products.dart';

//Components
import 'components/cartIcon.dart';
import 'components/categoryList.dart';
import 'components/orderSuccessContainer.dart';
import 'components/productList.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
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
        child: Consumer<CategoriesProvider>(
          builder: (context, categories, _) => Column(
            children: [
              categories.isOrderSuccess ? OrderSuccessContainer() : Container(),
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
