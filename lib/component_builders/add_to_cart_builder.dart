export '../bloc/bloc.dart';

import '../bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

typedef Widget AddToCartBuilderFunction(
    BuildContext context, CartItemState state, int quantity, CartItemBloc bloc);

class AddToCartBuilder extends StatefulWidget {
  final AddToCartBuilderFunction builder;
  final String productId;

  AddToCartBuilder({@required this.builder, @required this.productId});

  @override
  _AddToCartBuilderState createState() => _AddToCartBuilderState();
}

class _AddToCartBuilderState extends State<AddToCartBuilder> {
  CartItemBloc _bloc;

  @override
  void initState() {
    _bloc = new CartItemBloc(widget.productId);
    _bloc.add(FetchCartQuantity());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemBloc, CartItemState>(
      bloc: _bloc,
      builder: (context, state) {
        var quantity = 0;
        if (state is CartItemStateSuccess) quantity = state.quantity;
        return widget.builder(context, state, quantity, _bloc);
      },
    );
  }
}
