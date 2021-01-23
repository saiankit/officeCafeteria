import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:officecafeteria/utilities/colors.dart';

Widget loginLoading(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Please Wait...', style: Theme.of(context).textTheme.headline6),
        SpinKitPouringHourglass(color: AppColors.secondaryColor),
      ],
    );
