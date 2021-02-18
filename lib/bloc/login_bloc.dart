import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../services/services.dart';
import '../errors/errors.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      if (event is Login) {
        yield LoginStateLoading();
        var user = await UserService.instance
            .authenticate(username: event.username, password: event.password);
        yield LoginStateSuccess(user);
      }
    } on AuthTokenError catch (e) {
      yield LoginStateError(e);
    } on NetworkError catch (e) {
      yield LoginStateError(e);
    } catch (e) {
      yield LoginStateError(new AppError());
    }
  }
}
