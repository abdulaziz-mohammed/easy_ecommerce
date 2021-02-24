import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class Init extends AuthEvent {
  @override
  List<Object> get props => [];
}

class Login extends AuthEvent {
  final String username;
  final String password;

  Login({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username, password];
}

class Logout extends AuthEvent {
  @override
  List<Object> get props => [];
}
