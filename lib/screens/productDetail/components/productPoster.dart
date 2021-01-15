import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductPoster extends StatelessWidget {
  const ProductPoster({
    Key key,
    @required this.size,
    this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: size.width * 0.65,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: size.width * 0.55,
            width: size.width * 0.55,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          SvgPicture.asset(
            image,
            height: size.width * 0.60,
            width: size.width * 0.60,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
