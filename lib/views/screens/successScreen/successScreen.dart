import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/common/submitButton.dart';
import 'package:officecafeteria/views/screens/homeScreen/homeScreen.dart';

class SuccessScreen extends StatefulWidget {
  final String registrationId;

  const SuccessScreen({Key key, this.registrationId}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  Future<String> getRegistrationId() async {
    var info = await secureStorage.read(key: 'registrationId');
    return info;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeScreenColor,
      appBar: AppBar(
        backgroundColor: AppColors.homeScreenColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Registration Successful",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Registration ID"),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.secondaryColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: FlatButton(
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Color(0xFFF5F6F9),
                          onPressed: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/touch.svg",
                                color: AppColors.secondaryColor,
                                width: 22,
                              ),
                              SizedBox(width: 20),
                              Text(
                                widget.registrationId,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 1.25,
                  child: SvgPicture.asset("assets/success.svg"),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Return to",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SubmitButton(
                  label: "Home",
                  onPressed: () {
                    Future.delayed(Duration.zero, () {
                      Navigator.pop(context);
                    });
                    Future.delayed(Duration.zero, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
