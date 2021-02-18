export '../bloc/product_search_event.dart';
export '../bloc/product_search_state.dart';

import '../bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../models/models.dart';

typedef Widget SearchBuilderFunction(
    BuildContext context, ProductSearchState state, ProductSearchBloc bloc);

class SearchPageBuilder extends StatefulWidget {
  final SearchBuilderFunction builder;
  final SearchQuery initialQuery;

  SearchPageBuilder({@required this.builder, this.initialQuery});

  @override
  _SearchPageBuilderState createState() => _SearchPageBuilderState();
}

class _SearchPageBuilderState extends State<SearchPageBuilder> {
  final ProductSearchBloc _bloc = new ProductSearchBloc();

  @override
  void initState() {
    if (widget.initialQuery != null)
      _bloc.add(Search(query: widget.initialQuery));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSearchBloc, ProductSearchState>(
      bloc: _bloc,
      builder: (context, state) {
        return widget.builder(context, state, _bloc);
      },
    );
  }
}
