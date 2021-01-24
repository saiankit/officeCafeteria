import 'package:flutter/material.dart';
import 'package:officecafeteria/providers/categoriesProvider.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:officecafeteria/views/screens/viewOrder/viewOrderScreen.dart';
import 'package:provider/provider.dart';

class OrderSuccessContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizedBox buildOutlineButton({IconData icon, Function press}) {
      return SizedBox(
        width: 30,
        height: 30,
        child: OutlineButton(
          padding: EdgeInsets.zero,
          color: Color(0xffD3FFD9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: press,
          child: Icon(
            icon,
            color: AppColors.secondaryColor,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xff7FF08D),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                Text(
                  "Order Successful",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Spacer(),
                Consumer<CategoriesProvider>(
                  builder: (context, catProvider, _) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: buildOutlineButton(
                        icon: Icons.clear,
                        press: () {
                          catProvider.dismissOrderSuccess();
                        }),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewOrderScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Color(0xffD3FFD9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "View My Order",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
