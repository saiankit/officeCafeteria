import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:officecafeteria/providers/changeNotifiers/categoriesProvider.dart';
import 'package:provider/provider.dart';

import '../../../../providers/changeNotifiers/cartProvider.dart';
import '../../../../utilities/colors.dart';

import '../../viewOrder/viewOrderScreen.dart';

class DismissIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Consumer<CategoriesProvider>(
        builder: (context, categoriesProvider, _) => InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            categoriesProvider.dismissOrderSuccess();
          },
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                padding: EdgeInsets.all(12.0),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  "assets/clear.svg",
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
