import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:officecafeteria/providers/cartProvider.dart';
import 'package:officecafeteria/providers/categoriesProvider.dart';
import 'package:officecafeteria/providers/productCount.dart';
import 'package:officecafeteria/providers/userDataProvider.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:provider/provider.dart';
import 'views/screens/homeScreen/homeScreen.dart';
import 'views/screens/loginScreen/loginScreen.dart';

final secureStorage = FlutterSecureStorage();
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
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
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

class CustomAuthWrapper extends StatefulWidget {
  @override
  _CustomAuthWrapperState createState() => _CustomAuthWrapperState();
}

class _CustomAuthWrapperState extends State<CustomAuthWrapper> {
  Future<String> get jwtOrEmpty async {
    var jwt = await secureStorage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: jwtOrEmpty,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data != "") {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
