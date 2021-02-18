import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class LoginState extends Equatable {}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginStateLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginStateSuccess extends LoginState {
  final Customer user;

  LoginStateSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class LoginStateError extends LoginState {
  final Error error;

  LoginStateError(this.error);

  @override
  List<Object> get props => [error];
}
