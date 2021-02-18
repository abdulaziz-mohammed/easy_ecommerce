import '../generated/l10n.dart';
import 'package:intl/intl.dart';

import 'models.dart';

class Order {
  final String id;
  final double totalPrice;
  final double subTotal;
  final double tax;
  final String currency;
  final List<CartItem> items;
  final Address address;
  final String status;
  final DateTime createdAt;

  Order({
    this.id,
    this.totalPrice,
    this.subTotal,
    this.tax,
    this.currency,
    this.items,
    this.address,
    this.status,
    this.createdAt,
  });

  Order copyWith({
    String id,
    double totalPrice,
    double subTotal,
    double tax,
    String currency,
    List<CartItem> items,
    Address address,
    String status,
    DateTime createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      totalPrice: totalPrice ?? this.totalPrice,
      subTotal: subTotal ?? this.subTotal,
      tax: tax ?? this.tax,
      currency: currency ?? this.currency,
      items: items ?? this.items?.map((i) => i.copyWith())?.toList() ?? [],
      address: address ?? this.address,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  String _getFormatedPrice(double price) {
    var formater = new NumberFormat("#,##0.00", "en_US");
    return I18n.current.lang_COUNTRY.split("_")[0] == "ar"
        ? "${formater.format(price)} $currency"
        : "$currency ${formater.format(price)}";
  }

  String getFormatedTotal() {
    return _getFormatedPrice(totalPrice);
  }

  String getFormatedSubTotal() {
    return _getFormatedPrice(subTotal);
  }

  String getFormatedTax() {
    return _getFormatedPrice(tax);
  }
}
