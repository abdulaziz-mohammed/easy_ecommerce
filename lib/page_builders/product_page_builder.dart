export '../bloc/product_event.dart';
export '../bloc/product_state.dart';

import '../bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

typedef Widget ProductBuilderFunction(
    BuildContext context, ProductState state, ProductBloc bloc);

class ProductPageBuilder extends StatefulWidget {
  final ProductBuilderFunction builder;
  final String productId;

  ProductPageBuilder({@required this.builder, @required this.productId});

  @override
  _ProductPageBuilderState createState() => _ProductPageBuilderState();
}

class _ProductPageBuilderState extends State<ProductPageBuilder> {
  final ProductBloc _bloc = new ProductBloc();

  @override
  void initState() {
    _bloc.add(FetchProduct(widget.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      bloc: _bloc,
      builder: (context, state) {
        return widget.builder(context, state, _bloc);
      },
    );
  }
}
