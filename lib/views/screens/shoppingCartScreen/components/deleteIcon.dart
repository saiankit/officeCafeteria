import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../providers/changeNotifiers/cartProvider.dart';
import '../../../../utilities/colors.dart';

class ClearCartIcon extends StatelessWidget {
  void clearCart(BuildContext context, CartProvider cartProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Clear List"),
          content: Text("Are you sure you want to clear the items in Cart ?"),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Yes',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                cartProvider.clearItems();
                Future.delayed(Duration.zero, () {
                  Navigator.pop(context);
                });
              },
            ),
            FlatButton(
              child: new Text("No"),
              onPressed: () {
                Future.delayed(Duration.zero, () {
                  Navigator.pop(context);
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, _) => InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            clearCart(context, cartProvider);
          },
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                padding: EdgeInsets.all(12.0),
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  "assets/delete.svg",
                  height: 5.0,
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
