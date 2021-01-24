import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:officecafeteria/providers/cartProvider.dart';
import 'package:officecafeteria/providers/categoriesProvider.dart';
import 'package:officecafeteria/providers/loadingProvider.dart';
import 'package:officecafeteria/services/saveOrder.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/common/loadingWidget.dart';
import 'package:officecafeteria/views/screens/paymentScreen/components/paymentOption.dart';
import 'package:officecafeteria/views/screens/shoppingCartScreen/shoppingCartScreen.dart';
import 'package:provider/provider.dart';

import '../../../services/saveOrder.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingProvider>(
      builder: (context, loadingProvider, _) => Scaffold(
        backgroundColor: AppColors.homeScreenColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.secondaryColor,
            ),
            onPressed: () {
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
            },
          ),
          elevation: 0,
          title: Text(
            "Payment",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: AppColors.homeScreenColor,
        ),
        body: Builder(
          builder: (context) => loadingProvider.orderLoading
              ? orderLoading()
              : Stack(
                  children: [
                    Column(
                      children: [
                        Spacer(),
                        PlaceOrderButton(),
                      ],
                    ),
                    Column(
                      children: [
                        PaymentOption(
                          text: "Cash",
                          icon: "assets/cash.svg",
                        ),
                        PaymentOption(
                          text: "Credit Card",
                          icon: "assets/credit-card (1).svg",
                        ),
                        PaymentOption(
                          text: "Net Banking",
                          icon: "assets/online-banking.svg",
                        ),
                        PaymentOption(
                          text: "UPI",
                          icon: "assets/money-transfer.svg",
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

final secureStorage = FlutterSecureStorage();

class PlaceOrderButton extends StatefulWidget {
  @override
  _PlaceOrderButtonState createState() => _PlaceOrderButtonState();
}

class _PlaceOrderButtonState extends State<PlaceOrderButton> {
  Future<String> getRegistrationId() async {
    var regId = await secureStorage.read(key: 'registrationId');
    return regId;
  }

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
          SizedBox(
            width: 250,
            child: Consumer3<CartProvider, CategoriesProvider, LoadingProvider>(
              builder:
                  (context, cartProvider, catProvider, loadingProvider, _) =>
                      FutureBuilder<String>(
                future: getRegistrationId(),
                builder: (context, snapshot) {
                  return DefaultButton(
                    text: "Place Order",
                    press: () async {
                      loadingProvider.toggleOrderLoading();
                      var statusCode = await bookOrder(
                              registrationId: "${snapshot.data}",
                              cartList: cartItemList)
                          .catchError((error) => print(error));
                      if (statusCode == '201') {
                        cartProvider.clearItems();
                        catProvider.toggleOrderSuccess();
                        loadingProvider.toggleOrderLoading();
                        Future.delayed(Duration.zero, () {
                          Navigator.pop(context);
                        });
                        Future.delayed(Duration.zero, () {
                          Navigator.pop(context);
                        });
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
