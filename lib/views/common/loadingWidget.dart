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
