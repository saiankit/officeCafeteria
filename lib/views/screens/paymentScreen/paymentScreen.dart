import 'package:flutter/material.dart';
import 'package:officecafeteria/providers/cartProvider.dart';
import 'package:officecafeteria/providers/categoriesProvider.dart';
import 'package:officecafeteria/services/saveOrder.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/screens/shoppingCartScreen/shoppingCartScreen.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
          "Payment",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColors.homeScreenColor,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Spacer(),
              PlaceOrderButton(),
            ],
          ),
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Text("Credit Card"),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PlaceOrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CategoriesProvider>(
            builder: (context, catProvider, _) => SizedBox(
              width: 250,
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, _) => DefaultButton(
                  text: "Place Order",
                  press: () async {
                    var statusCode = await saveOrder(
                            registrationId: "pay123", cartList: cartItemList)
                        .catchError((error) => print(error));
                    if (statusCode == '201') {
                      cartProvider.clearItems();
                      catProvider.toggleOrderSuccess();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
