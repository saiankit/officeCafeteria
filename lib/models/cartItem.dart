import 'package:officecafeteria/models/product.dart';

class CartItem {
  final Product product;
  final int productCount;

  CartItem(this.product, this.productCount);
}
