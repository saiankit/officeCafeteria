import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:officecafeteria/providers/cartProvider.dart';
import 'package:officecafeteria/providers/categoriesProvider.dart';
import 'package:officecafeteria/services/saveOrder.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/common/loadingWidget.dart';
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
    return Scaffold(
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
              PaymentOption(
                text: "Cash",
                icon: "assets/cash.svg",
              ),
              PaymentOption(
                text: "Credit Card",
                icon: "assets/credit-card (1).svg",
              ),
              PaymentOption(
                text: "Netbanking",
                icon: "assets/online-banking.svg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentOption extends StatefulWidget {
  final String icon;
  final String text;

  const PaymentOption({Key key, this.icon, this.text}) : super(key: key);
  @override
  _PaymentOptionState createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.secondaryColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xFFF5F6F9),
          onPressed: () {},
          child: Row(
            children: [
              SvgPicture.asset(
                widget.icon,
                width: 30,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.text,
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
          Consumer<CategoriesProvider>(
            builder: (context, catProvider, _) => SizedBox(
              width: 250,
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, _) => FutureBuilder<String>(
                    future: getRegistrationId(),
                    builder: (context, snapshot) {
                      return DefaultButton(
                        text: "Place Order",
                        press: () async {
                          var statusCode = await bookOrder(
                                  registrationId: "${snapshot.data}",
                                  cartList: cartItemList)
                              .catchError((error) => print(error));
                          if (statusCode == '201') {
                            cartProvider.clearItems();
                            catProvider.toggleOrderSuccess();

                            Future.delayed(Duration.zero, () {
                              Navigator.pop(context);
                            });
                            Future.delayed(Duration.zero, () {
                              Navigator.pop(context);
                            });
                          }
                        },
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
