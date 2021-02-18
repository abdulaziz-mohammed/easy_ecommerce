import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class CreditCardsState extends Equatable {}

class CreditCardsStateInitial extends CreditCardsState {
  @override
  List<Object> get props => [];
}

class CreditCardsStateLoading extends CreditCardsState {
  @override
  List<Object> get props => [];
}

class CreditCardsStateSuccess extends CreditCardsState {
  final List<CreditCard> items;

  CreditCardsStateSuccess(this.items);

  @override
  List<Object> get props => [items];
}

class CreditCardsStateError extends CreditCardsState {
  final Error error;

  CreditCardsStateError(this.error);

  @override
  List<Object> get props => [error];
}
