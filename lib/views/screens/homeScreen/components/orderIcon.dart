import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../providers/changeNotifiers/cartProvider.dart';
import '../../../../utilities/colors.dart';

import '../../viewOrder/viewOrderScreen.dart';

class OrderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, _) => InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewOrderScreen(),
              ),
            );
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
                  "assets/order.svg",
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
