import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class ProductSearchEvent extends Equatable {}

class Search extends ProductSearchEvent {
  final SearchQuery query;

  Search({this.query});

  @override
  List<Object> get props => [query];
}

// class EditQuery extends ProductSearchEvent {
//   final SearchQuery query;

//   EditQuery({this.query}) : super([query]);
// }
