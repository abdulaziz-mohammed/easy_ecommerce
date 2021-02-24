export '../bloc/auth_event.dart';
export '../bloc/auth_state.dart';
export '../bloc/auth_bloc.dart';

import '../app/app_provider.dart';

import '../bloc/bloc.dart';
import '../bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

typedef Widget LoginBuilderFunction(
    BuildContext context, AuthState state, AuthBloc bloc);

class AuthPageBuilder extends StatefulWidget {
  final LoginBuilderFunction builder;

  AuthPageBuilder({@required this.builder});

  @override
  _AuthPageBuilderState createState() => _AuthPageBuilderState();
}

class _AuthPageBuilderState extends State<AuthPageBuilder> {
  final AuthBloc _bloc = new AuthBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: _bloc,
      buildWhen: (_, newState) {
        if (newState is LoggedInState) {
          context.read<AppProvider>().appRoutes.goToHomePage(context);
          return false;
        }
        return true;
      },
      builder: (context, state) {
        return widget.builder(context, state, _bloc);
      },
    );
  }
}
