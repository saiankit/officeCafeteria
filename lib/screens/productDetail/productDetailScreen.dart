import 'package:flutter/material.dart';
import 'package:officecafeteria/providers/productCount.dart';
import 'package:officecafeteria/screens/productDetail/components/addToTrayButton.dart';
import 'package:officecafeteria/utilities/colors.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import 'components/cardCounter.dart';
import 'components/productPoster.dart';

const kSecondaryColor = Color(0xFFFFA41B);
const kTextLightColor = Color(0xFF747474);

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black26,
);

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeScreenColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
      ),
      body: Body(
        product: product,
      ),
    );
  }
}

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    );
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: padding,
            decoration: BoxDecoration(
              color: AppColors.bgColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: '${product.id}',
                    child: ProductPoster(
                      size: size,
                      image: product.image,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Padding(
            padding: padding,
            child: Text(
              product.title,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\₹ ${product.price}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColor,
                  ),
                ),
                Text(
                  '@ 1 unit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kTextLightColor,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: padding,
            child: Text(
              product.description,
              style: TextStyle(
                color: kTextLightColor,
                fontSize: 18.0,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<ProductCount>(
                  builder: (context, count, _) => Text(
                    '\₹ ${product.price * count.productCount}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
                CartCounter(),
              ],
            ),
          ),
          Spacer(),
          Consumer<ProductCount>(
            builder: (context, count, _) => AddToTrayButton(
              product: product,
              productCount: count.productCount,
            ),
          ),
        ],
      ),
    );
  }
}
