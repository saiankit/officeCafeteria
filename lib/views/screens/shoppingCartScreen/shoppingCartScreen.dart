import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:officecafeteria/models/cartItem.dart';
import 'package:officecafeteria/providers/cartProvider.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:provider/provider.dart';

import 'components/shoppingCartCard.dart';

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
          "My Tray",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColors.homeScreenColor,
      ),
      body: Stack(
        children: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, _) => ListView.builder(
              shrinkWrap: true,
              itemCount: cartItemList.length,
              itemBuilder: (context, index) => ShoppingCartCard(
                cartItem: cartItemList[index],
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              CheckoutRow(),
            ],
          )
        ],
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xffF56F64),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CheckoutRow extends StatelessWidget {
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
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, _) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: "Total:\n",
                children: [
                  TextSpan(
                    text: "₹ ${cartProvider.totalAmount}",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 190,
              child: DefaultButton(
                text: "Check Out",
                press: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
