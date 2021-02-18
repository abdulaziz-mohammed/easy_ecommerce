import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent extends Equatable {}

class FetchProduct extends ProductEvent {
  final String id;

  FetchProduct(this.id);
  @override
  List<Object> get props => [id];
}
