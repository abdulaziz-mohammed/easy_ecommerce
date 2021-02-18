import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class AddressesState extends Equatable {}

class AddressesStateInitial extends AddressesState {
  @override
  List<Object> get props => [];
}

class AddressesStateLoading extends AddressesState {
  @override
  List<Object> get props => [];
}

class AddressesStateSuccess extends AddressesState {
  final List<Address> items;

  AddressesStateSuccess(this.items);

  @override
  List<Object> get props => [items];
}

class AddressesStateError extends AddressesState {
  final Error error;

  AddressesStateError(this.error);

  @override
  List<Object> get props => [error];
}
