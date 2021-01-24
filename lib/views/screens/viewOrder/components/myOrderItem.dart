import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:officecafeteria/models/serverModels/myOrder.dart';
import 'package:officecafeteria/utilities/styles.dart';

class MyOrderItem extends StatelessWidget {
  final OrderProduct orderItem;

  const MyOrderItem({Key key, this.orderItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 160,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: 136,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              boxShadow: [AppStyles.shadow],
            ),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Hero(
              tag: '${orderItem.id}',
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 130,
                width: 150,
                child: SvgPicture.asset(
                  orderItem.image,
                  height: 50.0,
                  width: 50.0,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 136,
              width: size.width - 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      orderItem.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "₹ ${orderItem.price * orderItem.count}",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "₹ ${orderItem.price} x ${orderItem.count}",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
