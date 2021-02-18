import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class AddressesEvent extends Equatable {}

class FetchAddresses extends AddressesEvent {
  @override
  List<Object> get props => [];
}

class CreateAddress extends AddressesEvent {
  final Address address;

  CreateAddress({@required this.address});

  @override
  List<Object> get props => [address];
}
