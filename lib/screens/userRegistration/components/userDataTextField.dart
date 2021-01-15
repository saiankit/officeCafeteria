import 'package:flutter/material.dart';
import 'package:officecafeteria/providers/userDataProvider.dart';
import 'package:provider/provider.dart';

class UserDataTextField extends StatefulWidget {
  final int userDataIndex;
  final String title;
  final TextInputType type;

  const UserDataTextField({this.userDataIndex, this.title, this.type});
  @override
  _UserDataTextFieldState createState() => _UserDataTextFieldState();
}

class _UserDataTextFieldState extends State<UserDataTextField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataProvider>(
      builder: (context, userData, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: TextFormField(
          onChanged: (String value) {
            if (widget.userDataIndex == 0) {
              userData.updateFullName(value);
            } else if (widget.userDataIndex == 1) {
              userData.updateOrganizationName(value);
            } else if (widget.userDataIndex == 2) {
              userData.updateEmployeeIdNumber(value);
            } else if (widget.userDataIndex == 3) {
              userData.updatePhoneNumber(value);
            } else if (widget.userDataIndex == 4) {
              userData.updateEmail(value);
            }
          },
          keyboardType: widget.type,
          decoration: InputDecoration(
            labelText: widget.title,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
