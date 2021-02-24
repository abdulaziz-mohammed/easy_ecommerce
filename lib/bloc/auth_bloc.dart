import 'dart:async';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import '../services/services.dart';
import '../errors/errors.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialAuthState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    try {
      if (event is Init) {
        yield LoadingState();
        if (await UserService.instance.isAuthinticated())
          yield LoggedInState(user);
        else
          yield LoggedOutState();
      }
      if (event is Login) {
        yield LoadingState();
        var user = await UserService.instance
            .authenticate(username: event.username, password: event.password);
        yield LoggedInState(user);
      }
      if (event is Logout) {
        yield LoadingState();
        await UserService.instance.logout();
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
