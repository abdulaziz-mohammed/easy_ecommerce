import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CartEvent extends Equatable {}

class FetchCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final String productId;
  final int quantity;

  AddToCart({this.productId, this.quantity});

  @override
  List<Object> get props => [productId, quantity];
}

class RemoveFromCart extends CartEvent {
  final String productId;

  RemoveFromCart({this.productId});

  @override
  List<Object> get props => [productId];
}

class UpdateToCart extends CartEvent {
  final String productId;
  final int quantity;

  UpdateToCart({this.productId, this.quantity});

  @override
  List<Object> get props => [productId, quantity];
}

// class AddCreditCard extends CartEvent {
//   final String creditCardId;

//   AddCreditCard({this.creditCardId}) : super([creditCardId]);
// }

class AddAddress extends CartEvent {
  final String addressId;

  AddAddress({this.addressId});

  @override
  List<Object> get props => [addressId];
}

class PlaceOrder extends CartEvent {
  final String creditCardId;
  PlaceOrder({this.creditCardId});

  @override
  List<Object> get props => [creditCardId];
}
