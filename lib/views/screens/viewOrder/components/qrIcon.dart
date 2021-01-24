import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/screens/qrScreen/qrScreen.dart';

class QrIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QrScreen(),
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
                "assets/qr-code.svg",
                height: 5.0,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
