import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'utilities/colors.dart';
import 'views/common/authWrapper.dart';
import 'providers/changeNotifiers/cartProvider.dart';
import 'providers/changeNotifiers/categoriesProvider.dart';
import 'providers/changeNotifiers/loadingProvider.dart';
import 'providers/changeNotifiers/orderProvider.dart';
import 'providers/changeNotifiers/paymentProvider.dart';
import 'providers/changeNotifiers/productCount.dart';
import 'providers/changeNotifiers/userDataProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserDataProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => ProductCount()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
          primaryColor: AppColors.secondaryColor,
          accentColor: AppColors.secondaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: CustomAuthWrapper(),
      ),
    );
  }
}
