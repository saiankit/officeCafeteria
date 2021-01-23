// Packages Import
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:officecafeteria/views/screens/homeScreen/components/settingsIcon.dart';
import 'package:officecafeteria/views/screens/viewOrder/viewOrderScreen.dart';
import 'package:provider/provider.dart';

// Providers
import '../../../providers/categoriesProvider.dart';

//Utilities
import '../../../providers/categoriesProvider.dart';
import '../../../utilities/colors.dart';
import '../../../data/products.dart';

//Components
import 'components/cartIcon.dart';
import 'components/categoryList.dart';
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

class OrderSuccessContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizedBox buildOutlineButton({IconData icon, Function press}) {
      return SizedBox(
        width: 40,
        height: 32,
        child: OutlineButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          onPressed: press,
          child: Icon(icon),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xff7FF08D),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                Text(
                  "Order Successful",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Spacer(),
                Consumer<CategoriesProvider>(
                  builder: (context, catProvider, _) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: buildOutlineButton(
                        icon: Icons.clear,
                        press: () {
                          catProvider.dismissOrderSuccess();
                        }),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewOrderScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Color(0xffD3FFD9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "View My Order",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
