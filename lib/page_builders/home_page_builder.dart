export '../bloc/home_event.dart';
export '../bloc/home_state.dart';

import '../bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

typedef Widget HomeBuilderFunction(
    BuildContext context, HomeState state, HomeBloc bloc);

class HomePageBuilder extends StatefulWidget {
  final HomeBuilderFunction builder;

  HomePageBuilder({@required this.builder});

  @override
  _HomePageBuilderState createState() => _HomePageBuilderState();
}

class _HomePageBuilderState extends State<HomePageBuilder> {
  final HomeBloc _bloc = new HomeBloc();

  @override
  void initState() {
    _bloc.add(FetchHome());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _bloc,
      builder: (context, state) {
        return widget.builder(context, state, _bloc);
      },
    );
  }
}
