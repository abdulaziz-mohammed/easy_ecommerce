import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class OrdersEvent extends Equatable {}

class FetchOrders extends OrdersEvent {
  @override
  List<Object> get props => [];
}

class CreateOrder extends OrdersEvent {
  final Order order;

  CreateOrder({@required this.order});

  @override
  List<Object> get props => [order];
}
