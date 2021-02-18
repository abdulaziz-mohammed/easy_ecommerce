import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../services/services.dart';
import '../errors/errors.dart';

class CreditCardsBloc extends Bloc<CreditCardsEvent, CreditCardsState> {
  CreditCardsBloc() : super(CreditCardsStateInitial());

  @override
  Stream<CreditCardsState> mapEventToState(
    CreditCardsEvent event,
  ) async* {
    try {
      if (event is FetchCreditCards) {
        yield CreditCardsStateLoading();
        final items = await CreditCardService.instance.getAll();
        yield CreditCardsStateSuccess(items);
      }
      if (event is CreateCreditCard) {
        yield CreditCardsStateLoading();
        await CreditCardService.instance.create(event.creditCard);
        final items = await CreditCardService.instance.getAll();
        yield CreditCardsStateSuccess(items);
      }
    } on AuthTokenError catch (e) {
      yield CreditCardsStateError(e);
    } on NetworkError catch (e) {
      yield CreditCardsStateError(e);
    } catch (e) {
      yield CreditCardsStateError(new AppError());
    }
  }
}
