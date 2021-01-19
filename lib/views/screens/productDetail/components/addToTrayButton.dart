import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:officecafeteria/models/cartItem.dart';
import 'package:officecafeteria/models/product.dart';
import 'package:officecafeteria/providers/cartProvider.dart';
import 'package:officecafeteria/providers/productCount.dart';
import 'package:provider/provider.dart';

class AddToTrayButton extends StatelessWidget {
  final Product product;
  final int productCount;

  const AddToTrayButton({Key key, this.product, this.productCount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Color(0xffF56F64),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, _) => Consumer<ProductCount>(
          builder: (context, count, _) => FlatButton(
            onPressed: () {
              cartProvider.addItemsToCart(CartItem(product, productCount));
              count.productCount = 1;
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/food_tray.svg",
                  height: 30.0,
                ),
                Text(
                  "Add to Tray",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
