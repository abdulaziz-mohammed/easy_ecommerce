import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class OrdersState extends Equatable {}

class OrdersStateInitial extends OrdersState {
  @override
  List<Object> get props => [];
}

class OrdersStateLoading extends OrdersState {
  @override
  List<Object> get props => [];
}

class OrdersStateSuccess extends OrdersState {
  final List<Order> items;

  OrdersStateSuccess(this.items);

  @override
  List<Object> get props => [items];
}

class OrdersStateError extends OrdersState {
  final Error error;

  OrdersStateError(this.error);

  @override
  List<Object> get props => [error];
}
