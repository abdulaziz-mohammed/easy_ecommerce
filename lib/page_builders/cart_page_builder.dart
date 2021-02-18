export '../bloc/bloc.dart';

import '../bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

typedef Widget CartBuilderFunction(
    BuildContext context, CartState state, CartBloc bloc);

class CartPageBuilder extends StatefulWidget {
  final CartBuilderFunction builder;

  CartPageBuilder({@required this.builder});

  @override
  _CartPageBuilderState createState() => _CartPageBuilderState();
}

class _CartPageBuilderState extends State<CartPageBuilder> {
  final CartBloc _bloc = new CartBloc();

  @override
  void initState() {
    _bloc.add(FetchCart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      bloc: _bloc,
      builder: (context, state) {
        return widget.builder(context, state, _bloc);
      },
    );
  }
}
