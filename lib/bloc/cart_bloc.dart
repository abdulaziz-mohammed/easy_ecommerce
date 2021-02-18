import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import '../models/models.dart';
import '../services/services.dart';
import '../errors/errors.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartStateInitial());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    try {
      if (event is FetchCart) {
        yield CartStateLoading();
        final cart = await CartService.instance.getCart();
        yield CartStateSuccess(cart);
      }

      if (event is AddToCart) {
        yield CartStateLoading();
        final cart = await CartService.instance
            .addProduct(productId: event.productId, quantity: event.quantity);
        yield CartStateSuccess(cart);
      }

      if (event is RemoveFromCart) {
        yield CartStateLoading();
        final cart = await CartService.instance
            .updateCart(productId: event.productId, quantity: 0);
        yield CartStateSuccess(cart);
      }

      if (event is UpdateToCart) {
        yield CartStateLoading();
        final cart = await CartService.instance
            .updateCart(productId: event.productId, quantity: event.quantity);
        yield CartStateSuccess(cart);
      }

      // if (event is AddCreditCard) {
      //   yield CartStateLoading();
      //   final cart = await CartService.instance
      //       .addCreditCard(creditCardId: event.creditCardId);
      //   yield CartStateSuccess(cart);
      // }

      if (event is AddAddress) {
        yield CartStateLoading();
        final cart =
            await CartService.instance.addAddress(addressId: event.addressId);
        yield CartStateSuccess(cart);
      }

      if (event is PlaceOrder) {
        yield CartStateLoading();
        final cart = await CartService.instance
            .addCreditCard(creditCardId: event.creditCardId);
        final order = await CartService.instance.placeOrder();
        yield CartStateSuccess(new Cart());
      }
    } on AuthTokenError catch (e) {
      yield CartStateError(e);
    } on NetworkError catch (e) {
      yield CartStateError(e);
    } catch (e) {
      yield CartStateError(new AppError());
    }
  }
}
