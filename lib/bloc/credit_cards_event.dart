import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class CreditCardsEvent extends Equatable {
  @override
  List<Object> get props => [props];
}

class FetchCreditCards extends CreditCardsEvent {
  @override
  List<Object> get props => [];
}

class CreateCreditCard extends CreditCardsEvent {
  final CreditCard creditCard;

  CreateCreditCard({@required this.creditCard});

  @override
  List<Object> get props => [creditCard];
}
