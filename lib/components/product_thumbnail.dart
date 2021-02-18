import 'package:flutter/material.dart';
import '../models/models.dart';

class ProductThumbnail extends StatelessWidget {
  final Product product;
  final double length;
  ProductThumbnail(this.product, {this.length = 40});

  @override
  Widget build(BuildContext context) {
    if (product.photos != null && product.photos.length > 0)
      return Image.network(
        product.photos[0],
        width: this.length,
        height: this.length,
        fit: BoxFit.contain,
      );
    else
      return Icon(
        Icons.broken_image,
        size: 50,
        color: Colors.grey[300],
      );
  }
}
