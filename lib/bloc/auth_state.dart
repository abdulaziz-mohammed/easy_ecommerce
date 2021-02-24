import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class AuthState extends Equatable {}

class InitialAuthState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoggedInState extends AuthState {
  final Customer user;

  LoggedInState(this.user);

  @override
  List<Object> get props => [user];
}

class LoggedOutState extends AuthState {
  @override
  List<Object> get props => [];
}

class ErrorState extends AuthState {
  final Error error;

  ErrorState(this.error);

  @override
  List<Object> get props => [error];
}
