import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class Login extends LoginEvent {
  final String username;
  final String password;

  Login({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username, password];
}
