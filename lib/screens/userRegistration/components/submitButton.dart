import 'package:flutter/material.dart';
import 'package:officecafeteria/utilities/colors.dart';

class SubmitButton extends StatefulWidget {
  final Function onPressed;

  const SubmitButton({Key key, this.onPressed}) : super(key: key);
  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "SUBMIT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
