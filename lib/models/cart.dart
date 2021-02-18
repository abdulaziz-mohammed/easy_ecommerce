import '../generated/l10n.dart';

import 'models.dart';
import 'package:intl/intl.dart';

class Cart {
  // final double totalPrice;
  // final double subTotal;
  // final double tax;
  final String currency;
  final List<CartItem> items;
  final List<CreditCard> creditCards;
  final CreditCard creditCard;
  final List<Address> addresses;
  final Address address;

  Cart({
    // this.totalPrice = 0,
    // this.subTotal = 0,
    // this.tax = 0,
    this.currency = "",
    this.items = const [],
    this.creditCards = const [],
    this.creditCard,
    this.addresses = const [],
    this.address,
  });

  Cart copyWith({
    double totalPrice,
    double subTotal,
    double tax,
    double currency,
    List<CartItem> items,
    List<CreditCard> creditCards,
    CreditCard creditCard,
    List<Address> addresses,
    Address address,
  }) {
    return Cart(
      // totalPrice: totalPrice ?? this.totalPrice,
      // subTotal: subTotal ?? this.subTotal,
      // tax: tax ?? this.tax,
      currency: currency ?? this.currency,
      items: items ?? this.items?.map((i) => i.copyWith())?.toList() ?? [],
      creditCards: creditCards ??
          this.creditCards?.map((i) => i.copyWith())?.toList() ??
          [],
      creditCard: creditCard ?? this.creditCard,
      addresses:
          addresses ?? this.addresses?.map((i) => i.copyWith())?.toList() ?? [],
      address: address ?? this.address,
    );
  }

  double get totalPrice {
    return subTotal + tax;
  }

  double get subTotal {
    return items.fold(
        0, (total, item) => total + item.product.price * item.quantity);
  }

  double get tax {
    return 0.05 * subTotal;
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
