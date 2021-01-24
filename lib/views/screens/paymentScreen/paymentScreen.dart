import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:officecafeteria/providers/cartProvider.dart';
import 'package:officecafeteria/providers/categoriesProvider.dart';
import 'package:officecafeteria/providers/loadingProvider.dart';
import 'package:officecafeteria/services/saveOrder.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/common/loadingWidget.dart';
import 'package:officecafeteria/views/screens/paymentScreen/components/paymentOption.dart';
import 'package:officecafeteria/views/screens/shoppingCartScreen/shoppingCartScreen.dart';
import '../../../services/saveOrder.dart';

final secureStorage = FlutterSecureStorage();

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _setTime;

  String _hour, _minute, _time;

  String dateTime;

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
    print(_timeController.text);
  }

  @override
  void initState() {
    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext paymentScreencontext) {
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Consumer3<LoadingProvider, CartProvider, CategoriesProvider>(
      builder: (context, loadingProvider, cartProvider, catProvider, _) =>
          Scaffold(
        backgroundColor: AppColors.homeScreenColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.secondaryColor,
            ),
            onPressed: () {
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
            },
          ),
          elevation: 0,
          title: Text(
            "Payment",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: AppColors.homeScreenColor,
        ),
        body: Builder(
          builder: (context) => loadingProvider.orderLoading
              ? orderLoading()
              : Stack(
                  children: [
                    Column(
                      children: [
                        Spacer(),
                        PlaceOrderRow(
                          paymentScreenContext: paymentScreencontext,
                          takeAwayTime: _timeController.text,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        PaymentOption(
                          text: "Cash",
                          icon: "assets/cash.svg",
                        ),
                        PaymentOption(
                          text: "Credit Card",
                          icon: "assets/credit-card (1).svg",
                        ),
                        PaymentOption(
                          text: "Net Banking",
                          icon: "assets/online-banking.svg",
                        ),
                        PaymentOption(
                          text: "UPI",
                          icon: "assets/money-transfer.svg",
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Choose Take - Away time",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.secondaryColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: FlatButton(
                              onPressed: () {
                                _selectTime(context);
                              },
                              padding: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    "assets/chronometer.svg",
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                      textAlign: TextAlign.center,
                                      onSaved: (String val) {
                                        _setTime = val;
                                      },
                                      enabled: false,
                                      keyboardType: TextInputType.text,
                                      controller: _timeController,
                                      decoration: InputDecoration(
                                        disabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class PlaceOrderRow extends StatelessWidget {
  final BuildContext paymentScreenContext;
  final String takeAwayTime;

  const PlaceOrderRow({Key key, this.paymentScreenContext, this.takeAwayTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<String> getRegistrationId() async {
      var regId = await secureStorage.read(key: 'registrationId');
      return regId;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: Consumer3<CartProvider, LoadingProvider, CategoriesProvider>(
        builder: (context, cartProvider, loadingProvider, catProvider, _) =>
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: "Total:\n",
                children: [
                  TextSpan(
                    text: "₹ ${cartProvider.totalAmount}",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 190,
              child: FutureBuilder<String>(
                future: getRegistrationId(),
                builder: (context, snapshot) {
                  return DefaultButton(
                    text: "Place Order",
                    press: () async {
                      loadingProvider.toggleOrderLoading();
                      var statusCode = await bookOrder(
                        registrationId: "${snapshot.data}",
                        cartList: cartItemList,
                        takeAwayTime: this.takeAwayTime,
                      );
                      if (statusCode == '201') {
                        cartProvider.clearItems();
                        catProvider.toggleOrderSuccess();
                        loadingProvider.toggleOrderLoading();
                        Future.delayed(Duration.zero, () {
                          Navigator.pop(paymentScreenContext);
                        });
                        Future.delayed(Duration.zero, () {
                          Navigator.pop(paymentScreenContext);
                        });
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
