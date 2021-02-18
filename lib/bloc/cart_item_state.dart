import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CartItemState extends Equatable {}

class CartItemStateInitial extends CartItemState {
  @override
  List<Object> get props => [];
}

class CartItemStateLoading extends CartItemState {
  @override
  List<Object> get props => [];
}

class CartItemStateSuccess extends CartItemState {
  final int quantity;

  CartItemStateSuccess(this.quantity);

  @override
  List<Object> get props => [quantity];
}

class CartItemStateError extends CartItemState {
  final Error error;

  CartItemStateError(this.error);

  @override
  List<Object> get props => [error];
}
