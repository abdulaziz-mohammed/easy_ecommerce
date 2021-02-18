export '../bloc/bloc.dart';

import '../bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

typedef Widget OrdersBuilderFunction(
    BuildContext context, OrdersState state, OrdersBloc bloc);

class OrdersPageBuilder extends StatefulWidget {
  final OrdersBuilderFunction builder;

  OrdersPageBuilder({@required this.builder});

  @override
  _OrdersPageBuilderState createState() => _OrdersPageBuilderState();
}

class _OrdersPageBuilderState extends State<OrdersPageBuilder> {
  final OrdersBloc _bloc = new OrdersBloc();

  @override
  void initState() {
    _bloc.add(FetchOrders());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      bloc: _bloc,
      builder: (context, state) {
        return widget.builder(context, state, _bloc);
      },
    );
  }
}
