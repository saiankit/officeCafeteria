import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:officecafeteria/utilities/colors.dart';

Widget loginLoading() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Please Wait...', style: TextStyle(fontSize: 20.0)),
        SpinKitPouringHourglass(color: AppColors.secondaryColor),
      ],
    );

Widget orderLoading() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Placing your Order...', style: TextStyle(fontSize: 20.0)),
        SpinKitDoubleBounce(color: AppColors.secondaryColor),
      ],
    );
