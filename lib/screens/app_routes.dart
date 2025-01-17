import 'package:easy_ecommerce/page_builders/orders_page_builder.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import './screens.dart';

class AppRoutes {
  static const LOADING = '/';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const PRODUCT = '/product';
  static const SEARCH = '/search';
  static const CART = '/cart';
  static const SHIPPING = '/shipping';
  static const PAYMENT = '/payment';
  static const PLACE_ORDER = '/placeOrder';
  static const ADDRESS = '/address';
  static const CREDIT_CARD = '/creditCard';
  static const ORDERS = '/orders';
  static const ORDER = '/order';

  Future<void> goToLoginPage(BuildContext context,
      {bool forceLogin = false}) async {
    await UserService.instance.logout();
    if (forceLogin)
      await Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.LOGIN, (_) => false);
    else
      await Navigator.of(context).pushNamed(AppRoutes.LOGIN);
  }

  Future<void> goToHomePage(BuildContext context) async {
    // if (await UserService.instance.isAuthinticated())
    // if (context.read<AuthBloc>().user != null)
    await Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.HOME, (_) => false);
  }

  Future<void> goToProductPage(BuildContext context, String productId) async {
    await Navigator.of(context)
        .pushNamed(AppRoutes.PRODUCT, arguments: productId);
  }

  Future<void> goToSearchPage(BuildContext context, {SearchQuery query}) async {
    // if (await UserService.instance.isAuthinticated())
    // if (context.read<AuthBloc>().user != null)
    await Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.SEARCH, (route) => route.settings.name == AppRoutes.HOME);
  }

  Future<void> goToCartPage(BuildContext context) async {
    await Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.CART, (route) => route.settings.name == AppRoutes.HOME);
  }

  Future<void> goToShippingPage(BuildContext context) async {
    await Navigator.of(context).pushNamed(AppRoutes.SHIPPING);
  }

  Future<void> goToPaymentPage(BuildContext context) async {
    await Navigator.of(context).pushNamed(AppRoutes.PAYMENT);
  }

  Future<void> goToPlaceOrderPage(BuildContext context) async {
    await Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.PLACE_ORDER,
        (route) => route.settings.name == AppRoutes.HOME);
  }

  Future<dynamic> goToAddressPage(BuildContext context, Address address) async {
    return await Navigator.of(context)
        .pushNamed(AppRoutes.ADDRESS, arguments: address);
  }

  Future<dynamic> goToCreditCardPage(
      BuildContext context, CreditCard creditCard) async {
    return await Navigator.of(context)
        .pushNamed(AppRoutes.CREDIT_CARD, arguments: creditCard);
  }

  Future<dynamic> goToOrdersPage(BuildContext context) async {
    return await Navigator.of(context).pushNamed(AppRoutes.ORDERS);
  }

  Future<dynamic> goToOrderPage(BuildContext context, Order order) async {
    return await Navigator.of(context)
        .pushNamed(AppRoutes.ORDER, arguments: order);
  }

  Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.LOADING: (_) => LoadingScreen(),
    AppRoutes.HOME: (_) => HomeScreen(),
    AppRoutes.LOGIN: (_) => LoginScreen(),
    AppRoutes.PRODUCT: (_) => ProductScreen(),
    AppRoutes.SEARCH: (_) => SearchScreen(),
    AppRoutes.CART: (_) => CartScreen(),
    AppRoutes.SHIPPING: (_) => ShippingScreen(),
    AppRoutes.PAYMENT: (_) => PaymentScreen(),
    AppRoutes.PLACE_ORDER: (_) => PlaceOrderScreen(),
    AppRoutes.ADDRESS: (_) => AddressScreen(),
    AppRoutes.CREDIT_CARD: (_) => CreditCardScreen(),
  };
}
