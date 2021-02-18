import 'dart:async';
import 'package:bloc/bloc.dart';
import '../models/models.dart';
import 'bloc.dart';
import '../services/services.dart';
import '../errors/errors.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersStateInitial());

  @override
  Stream<OrdersState> mapEventToState(
    OrdersEvent event,
  ) async* {
    try {
      if (event is FetchOrders) {
        yield OrdersStateLoading();
        final items = await OrdersService.instance.getAll();
        yield OrdersStateSuccess(items);
      }
      if (event is CreateOrder) {
        yield OrdersStateLoading();
        await OrdersService.instance.create(event.order);
        final items = await OrdersService.instance.getAll();
        yield OrdersStateSuccess(items);
      }
    } on AuthTokenError catch (e) {
      yield OrdersStateError(e);
    } on NetworkError catch (e) {
      yield OrdersStateError(e);
    } catch (e) {
      yield OrdersStateError(new AppError());
    }
  }
}
