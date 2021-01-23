import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:officecafeteria/providers/cartProvider.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/screens/settingsScreen/profileScreen.dart';
import 'package:provider/provider.dart';

class SettingsIcon extends StatelessWidget {
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
                builder: (context) => SettingsScreen(),
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
                  "assets/settings.svg",
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
