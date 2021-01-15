import 'package:flutter/material.dart';
import 'package:officecafeteria/models/cartItem.dart';
import 'package:officecafeteria/providers/cartProvider.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:provider/provider.dart';

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
        backgroundColor: AppColors.homeScreenColor,
      ),
      body: Container(
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, _) => ListView.builder(
            itemCount: cartItemList.length,
            itemBuilder: (context, index) => Text(
              cartItemList[index].product.title,
            ),
          ),
        ),
      ),
    );
  }
}

class ShoppingCartCard extends StatelessWidget {
  final CartItem cartItem;

  const ShoppingCartCard({Key key, this.cartItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
