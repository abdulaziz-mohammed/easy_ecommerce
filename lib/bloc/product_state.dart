import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class ProductState extends Equatable {}

class InitialProductState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductStateLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductStateSuccess extends ProductState {
  final Product item;

  ProductStateSuccess(this.item);
  @override
  List<Object> get props => [item];
}

class ProductStateError extends ProductState {
  final Error error;

  ProductStateError(this.error);

  @override
  List<Object> get props => [error];
}
