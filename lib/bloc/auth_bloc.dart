import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_ecommerce/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc.dart';
import '../services/services.dart';
import '../errors/errors.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialAuthState()) {
    add(Init());
  }

  Customer user;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    try {
      if (event is Init) {
        yield LoadingState();
        // if (user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // if (prefs.getString('user') != null) {
        //   user = Customer.fromJson(prefs.getString('user'));
        //   yield LoggedInState(user);
        // }
        // } else
        yield LoggedOutState();
      }
      if (event is Login) {
        yield LoadingState();
        user = await UserService.instance
            .authenticate(username: event.username, password: event.password);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', user.toJson());

        yield LoggedInState(user);
      }
      if (event is Logout) {
        yield LoadingState();
        await UserService.instance.logout();
        user = null;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', null);
        yield LoggedOutState();
      }
    } on AuthTokenError catch (e) {
      yield ErrorState(e);
    } on NetworkError catch (e) {
      yield ErrorState(e);
    } catch (e) {
      yield ErrorState(new AppError());
    }
  }
}
