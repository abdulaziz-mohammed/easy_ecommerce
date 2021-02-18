import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import '../services/services.dart';
import '../errors/errors.dart';

class CartItemBloc extends Bloc<CartItemEvent, CartItemState> {
  CartItemBloc(this.productId) : super(CartItemStateInitial());

  final String productId;

  @override
  Stream<CartItemState> mapEventToState(
    CartItemEvent event,
  ) async* {
    try {
      if (event is FetchCartQuantity) {
        yield CartItemStateLoading();
        final cart = await CartService.instance.getCart();
        var cartItem = cart.items.firstWhere((a) => a.product.id == productId);
        yield CartItemStateSuccess(cartItem.quantity);
      }

      if (event is QuickAdd) {
        yield CartItemStateLoading();
        final cart = await CartService.instance
            .updateCart(productId: productId, quantity: event.quantity);
        var cartItem = cart.items.firstWhere((a) => a.product.id == productId);
        yield CartItemStateSuccess(cartItem.quantity);
      }
    } on AuthTokenError catch (e) {
      yield CartItemStateError(e);
    } on NetworkError catch (e) {
      yield CartItemStateError(e);
    } catch (e) {
      yield CartItemStateError(new AppError());
    }
  }
}
