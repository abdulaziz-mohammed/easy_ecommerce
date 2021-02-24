import 'dart:async';

import '../services/services.dart';
import '../models/models.dart';
import 'service_base.dart';

class CartService extends ServcieBase {
  Cart _cart = new Cart();

  static final CartService instance = new CartService();

  var _onCartChange = new StreamController<Cart>.broadcast();

  void set localCart(Cart cart) =>
      _onCartChange.sink.add(_cart = cart.copyWith());

  Cart get localCart => _cart;

  Cart setLocalCart(Cart cart) {
    _onCartChange.sink.add(_cart = cart.copyWith());
    return _cart;
  }

  Stream<Cart> onCartChange() {
    return _onCartChange.stream;
  }

  Future<Cart> getCart() async {
    return localCart =
        await client.getCart(await UserService.instance.getToken());
  }

  Future<Cart> addProduct({String productId, int quantity}) async {
    return localCart = await client.addToCart(
        await UserService.instance.getToken(), productId, quantity);
  }

  Future<Cart> updateCart({String productId, int quantity}) async {
    return localCart = await client.updateCart(
        await UserService.instance.getToken(), productId, quantity);
  }

  Future<Cart> addCreditCard({String creditCardId}) async {
    return localCart = await client.addCreditCardToCart(
        await UserService.instance.getToken(), creditCardId);
  }

  Future<Cart> addAddress({String addressId}) async {
    return localCart = await client.addAddressToCart(
        await UserService.instance.getToken(), addressId);
  }

  Future<Order> placeOrder() async {
    var order = await client.placeOrder(await UserService.instance.getToken());
    localCart = new Cart();
    return order;
  }
}
