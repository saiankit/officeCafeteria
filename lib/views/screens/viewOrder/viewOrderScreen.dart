import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/changeNotifiers/orderProvider.dart';
import '../../../utilities/colors.dart';

import 'components/myOrderItem.dart';
import 'components/qrIcon.dart';

class ViewOrderScreen extends StatefulWidget {
  @override
  _ViewOrderScreenState createState() => _ViewOrderScreenState();
}

class _ViewOrderScreenState extends State<ViewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, _) => Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Scaffold(
          backgroundColor: AppColors.homeScreenColor,
          appBar: AppBar(
            backgroundColor: AppColors.homeScreenColor,
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
              "My Order",
              style: TextStyle(color: Colors.black),
            ),
            actions: [QrIcon()],
          ),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                TimeSlot(orderTime: orderProvider.myOrder.takeAwayTime),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: orderProvider.myOrder.orderProducts.length,
                      itemBuilder: (context, index) => MyOrderItem(
                        orderItem: orderProvider.myOrder.orderProducts[index],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimeSlot extends StatefulWidget {
  final String orderTime;

  const TimeSlot({Key key, this.orderTime}) : super(key: key);
  @override
  _TimeSlotState createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
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
          onPressed: () {},
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "assets/chronometer.svg",
                width: 30,
              ),
              SizedBox(width: 20.0),
              Text(
                "Take Away Time:   ",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                widget.orderTime,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
