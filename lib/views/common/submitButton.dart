import 'package:flutter/material.dart';
import 'package:officecafeteria/utilities/colors.dart';

class SubmitButton extends StatefulWidget {
  final String label;
  final Function onPressed;
  final bool flip;

  const SubmitButton({Key key, this.onPressed, this.label, this.flip = false})
      : super(key: key);
  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: widget.flip
              ? AppColors.homeScreenColor
              : AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 1.5,
              color: widget.flip
                  ? AppColors.secondaryColor
                  : AppColors.secondaryColor),
        ),
        child: FlatButton(
          onPressed: widget.onPressed,
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: widget.flip ? AppColors.secondaryColor : Colors.white,
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
