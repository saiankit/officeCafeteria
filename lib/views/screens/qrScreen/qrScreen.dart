import 'package:flutter/material.dart';
import 'package:officecafeteria/providers/changeNotifiers/orderProvider.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Scaffold(
        backgroundColor: AppColors.homeScreenColor,
        appBar: AppBar(
          backgroundColor: AppColors.homeScreenColor,
          elevation: 0,
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
        ),
        body: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Column(
                children: [
                  Text(
                    "Show this at the cafeteria to verify your Order",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
            Consumer<OrderProvider>(
              builder: (context, orderProvider, _) => Center(
                child: QrImage(
                  data: orderProvider.myOrder.orderId,
                  version: QrVersions.auto,
                  size: MediaQuery.of(context).size.height / 3,
                  gapless: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
