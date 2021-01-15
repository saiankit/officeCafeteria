import 'package:flutter/material.dart';
import 'package:officecafeteria/providers/productCount.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductCount>(
      builder: (context, count, _) => Row(
        children: <Widget>[
          buildOutlineButton(
            icon: Icons.remove,
            press: () {
              setState(() {
                numOfItems--;
              });
              count.decrementCounter();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              // if our item is less  then 10 then  it shows 01 02 like that
              count.productCount.toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          buildOutlineButton(
              icon: Icons.add,
              press: () {
                setState(() {
                  numOfItems++;
                });
                count.updateCounter();
              }),
        ],
      ),
    );
  }

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
}
