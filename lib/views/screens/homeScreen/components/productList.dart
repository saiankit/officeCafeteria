import 'package:flutter/material.dart';
import '../components/productCard.dart';
import '../../productDetail/productDetailScreen.dart';

class ProductsList extends StatefulWidget {
  final List list;

  const ProductsList({Key key, this.list}) : super(key: key);
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) => ProductCard(
          itemIndex: index,
          product: widget.list[index],
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  product: widget.list[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
