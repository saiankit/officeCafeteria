import 'package:officecafeteria/models/product.dart';

class CartItem {
  final Product product;
  var productCount;

  CartItem(this.product, this.productCount);

  Map<String, dynamic> toJson() => {
        "id": product.id == null ? null : product.id,
        "price": product.price == null ? null : product.price,
        "title": product.title == null ? null : product.title,
        "description": product.description == null ? null : product.description,
        "count": productCount == null ? null : productCount,
        "image": product.image == null ? null : product.image,
      };
}
