export '../bloc/login_event.dart';
export '../bloc/login_state.dart';
export '../bloc/login_bloc.dart';

import '../app/app_provider.dart';

import '../bloc/bloc.dart';
import '../bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

typedef Widget LoginBuilderFunction(
    BuildContext context, LoginState state, LoginBloc bloc);

class LoginPageBuilder extends StatefulWidget {
  final LoginBuilderFunction builder;

  LoginPageBuilder({@required this.builder});

  @override
  _LoginPageBuilderState createState() => _LoginPageBuilderState();
}

class _LoginPageBuilderState extends State<LoginPageBuilder> {
  final LoginBloc _bloc = new LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _bloc,
      buildWhen: (_, newState) {
        if (newState is LoginStateSuccess) {
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
