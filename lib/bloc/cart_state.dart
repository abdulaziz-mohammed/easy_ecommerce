import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class CartState extends Equatable {}

class CartStateInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartStateLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartStateSuccess extends CartState {
  final Cart cart;

  CartStateSuccess(this.cart);

  @override
  List<Object> get props => [cart];
}

class CartStateError extends CartState {
  final Error error;

  CartStateError(this.error);

  @override
  List<Object> get props => [error];
}
