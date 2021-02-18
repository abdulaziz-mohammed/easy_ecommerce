import '../generated/l10n.dart';

import '../models/models.dart';
import 'package:intl/intl.dart';

class Product {
  final String id;
  final double price;
  final double oldPrice;
  final String currency;
  final String title;
  final String description;
  final List<String> photos;
  final List<Category> categories;
  final bool featured;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.currency,
    this.title,
    this.description,
    this.photos,
    this.categories,
    this.featured,
  });

  Product copyWith({
    String id,
    double price,
    String currency,
    String title,
    String description,
    List<String> photos,
    List<Category> categories,
    bool featured,
  }) {
    return Product(
      id: id ?? this.id,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      currency: currency ?? this.currency,
      title: title ?? this.title,
      description: description ?? this.description,
      photos: photos ?? this.photos?.map((p) => p)?.toList() ?? [],
      categories: categories ??
          this.categories?.map((c) => c.copyWith())?.toList() ??
          [],
      featured: featured ?? this.featured,
    );
  }

  String _getFormatedPrice(double price) {
    var formater = new NumberFormat("#,##0.00", "en_US");
    return I18n.current.lang_COUNTRY.split("_")[0] == "ar"
        ? "${formater.format(price)} $currency"
        : "$currency ${formater.format(price)}";
  }

  String getFormatedPrice() {
    return _getFormatedPrice(price);
  }

  String getFormatedOldPrice() {
    return _getFormatedPrice(oldPrice);
  }
}
