import '../../generated/l10n.dart';
import 'package:flutter/material.dart';

import '../screens.dart';
import '../../page_builders/login_page_builder.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  final _form = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LoginPageBuilder(builder: (context, state, bloc) {
      if (state is LoginStateLoading || state is LoginStateSuccess)
        return LoadingScreen();

      return Scaffold(
        appBar: AppBar(
          title: Text(I18n.of(context).login),
        ),
        body: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _username,
                  decoration: InputDecoration(
                    labelText: I18n.of(context).username,
                  ),
                ),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: I18n.of(context).password,
                  ),
                  obscureText: true,
                ),
                RaisedButton(
                  child: Text(I18n.of(context).login),
                  // color: Theme.of(context).primaryColor,
                  onPressed: () => _loginPressed(bloc),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  _loginPressed(LoginBloc bloc) {
    FocusScope.of(context).requestFocus(new FocusNode());
    bloc.add(Login(username: _username.text, password: _password.text));
  }
}
