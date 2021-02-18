import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CartItemEvent extends Equatable {}

class FetchCartQuantity extends CartItemEvent {
  @override
  List<Object> get props => [];
}

class QuickAdd extends CartItemEvent {
  final int quantity;

  QuickAdd({this.quantity});

  @override
  List<Object> get props => [quantity];
}
