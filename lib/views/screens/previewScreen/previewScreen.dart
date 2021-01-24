import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:officecafeteria/providers/loadingProvider.dart';
import 'package:officecafeteria/services/aboutMe.dart';
import 'package:officecafeteria/services/registerUser.dart';
import 'package:officecafeteria/views/common/loadingWidget.dart';
import 'package:officecafeteria/views/common/submitButton.dart';
import 'package:officecafeteria/views/screens/successScreen/successScreen.dart';
import 'package:provider/provider.dart';

import '../../../providers/userDataProvider.dart';
import '../homeScreen/homeScreen.dart';
import '../../../utilities/colors.dart';

final secureStorage = FlutterSecureStorage();

class PreviewScreen extends StatelessWidget {
  saveJwt(String token) async {
    await secureStorage.write(key: 'jwt', value: token);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoadingProvider, UserDataProvider>(
      builder: (context, loadingProvider, userData, _) => Scaffold(
        backgroundColor: AppColors.homeScreenColor,
        appBar: AppBar(
          title: Text('Preview Details'),
          backgroundColor: AppColors.secondaryColor,
          centerTitle: false,
        ),
        body: Builder(
          builder: (context) => loadingProvider.registrationLoading
              ? loginLoading()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileDetails(
                        label: userData.fullName,
                        icon: "assets/user.svg",
                      ),
                      ProfileDetails(
                        label: userData.employeeId,
                        icon: "assets/touch.svg",
                      ),
                      ProfileDetails(
                        label: userData.oraganisationName,
                        icon: "assets/group.svg",
                      ),
                      ProfileDetails(
                        label: userData.phoneNumber.toString(),
                        icon: "assets/phone-call.svg",
                      ),
                      ProfileDetails(
                        label: userData.email,
                        icon: "assets/email.svg",
                      ),
                      userData.idCardImage == null
                          ? Container()
                          : SizedBox(
                              height: 300.0,
                              width: 300.0,
                              child: Image.file(userData.idCardImage),
                            ),
                      SubmitButton(
                        label: "REGISTER",
                        onPressed: () async {
                          loadingProvider.toggleRegistrationLoading();
                          var response = await registerUser(
                            name: userData.fullName,
                            organization: userData.oraganisationName,
                            employeeId: userData.employeeId,
                            phoneNumber: userData.phoneNumber,
                            email: userData.email,
                            password: userData.password,
                          );
                          if (response[1] == "201") {
                            saveJwt(response[0]);
                            var aboutMyInfo =
                                await aboutMe(jwtToken: response[0]);
                            // Popping out the Preview Screen
                            if (aboutMyInfo == "200") {
                              loadingProvider.toggleRegistrationLoading();
                              Future.delayed(Duration.zero, () {
                                Navigator.pop(context);
                              });
                              // Popping out the User Details Screen
                              Future.delayed(Duration.zero, () {
                                Navigator.pop(context);
                              });
                              // Popping out the Register Screen
                              Future.delayed(Duration.zero, () {
                                Navigator.pop(context);
                              });
                              Future.delayed(Duration.zero, () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SuccessScreen(),
                                  ),
                                );
                              });
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final String label;
  final String icon;

  const ProfileDetails({Key key, this.label, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(15),
        ),
        child: FlatButton(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onPressed: () {},
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                color: AppColors.secondaryColor,
                width: 22,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  this.label,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
