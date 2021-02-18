import 'models.dart';

class CartItem {
  final Product product;
  final int quantity;
  final Map data;

  CartItem({this.product, this.quantity, this.data});

  CartItem copyWith({Product product, int quantity}) {
    return CartItem(
      product: product ?? this.product.copyWith(),
      quantity: quantity ?? this.quantity,
      data: data ?? this.data,
    );
  }
}
