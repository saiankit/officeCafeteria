import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:officecafeteria/providers/changeNotifiers/paymentProvider.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:provider/provider.dart';

class PaymentOption extends StatefulWidget {
  final String icon;
  final String text;

  const PaymentOption({Key key, this.icon, this.text}) : super(key: key);
  @override
  _PaymentOptionState createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(
      builder: (context, paymentProvider, _) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondaryColor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: widget.text == "Cash"
                ? paymentProvider.cash
                    ? Color(0xffbaf1a1)
                    : Color(0xFF5F6F9)
                : widget.text == "Credit Card"
                    ? paymentProvider.creditCard
                        ? Color(0xffbaf1a1)
                        : Color(0xFF5F6F9)
                    : widget.text == "Net Banking"
                        ? paymentProvider.netBanking
                            ? Color(0xffbaf1a1)
                            : Color(0xFF5F6F9)
                        : widget.text == "UPI"
                            ? paymentProvider.upi
                                ? Color(0xffbaf1a1)
                                : Color(0xFF5F6F9)
                            : paymentProvider.upi
                                ? Color(0xffbaf1a1)
                                : Color(0xFF5F6F9),
            onPressed: () {
              if (widget.text == "Cash") {
                paymentProvider.selectCash();
              } else if (widget.text == "Credit Card") {
                paymentProvider.selectCreditCard();
              } else if (widget.text == "Net Banking") {
                paymentProvider.selectNetBanking();
              } else {
                paymentProvider.selectUpi();
              }
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  widget.icon,
                  width: 30,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.text,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
