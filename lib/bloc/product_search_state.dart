import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class ProductSearchState extends Equatable {}

class ProductSearchStateInitial extends ProductSearchState {
  @override
  List<Object> get props => [];
}

// class ProductSearchStateEditQuery extends ProductSearchState {
//   final SearchQuery query;

//   ProductSearchStateEditQuery(this.query) : super([query]);

//   @override
//   String toString() => 'ProductSearchStateEditQuery { query: ${query} }';
// }

class ProductSearchStateLoading extends ProductSearchState {
  @override
  List<Object> get props => [];
}

class ProductSearchStateSuccess extends ProductSearchState {
  final SearchQuery query;
  final List<Product> items;

  ProductSearchStateSuccess(this.query, this.items);

  @override
  List<Object> get props => [items];
}

class ProductSearchStateError extends ProductSearchState {
  final Error error;

  ProductSearchStateError(this.error);

  @override
  List<Object> get props => [error];
}
