import 'dart:async';
import 'package:bloc/bloc.dart';
import '../models/models.dart';
import './bloc.dart';
import '../services/services.dart';
import '../errors/errors.dart';

class AddressesBloc extends Bloc<AddressesEvent, AddressesState> {
  AddressesBloc() : super(AddressesStateInitial());

  @override
  Stream<AddressesState> mapEventToState(
    AddressesEvent event,
  ) async* {
    try {
      if (event is FetchAddresses) {
        yield AddressesStateLoading();
        final items = await AddressService.instance.getAll();
        yield AddressesStateSuccess(items);
      }
      if (event is CreateAddress) {
        yield AddressesStateLoading();
        await AddressService.instance.create(event.address);
        final items = await AddressService.instance.getAll();
        yield AddressesStateSuccess(items);
      }
    } on AuthTokenError catch (e) {
      yield AddressesStateError(e);
    } on NetworkError catch (e) {
      yield AddressesStateError(e);
    } catch (e) {
      yield AddressesStateError(new AppError());
    }
  }
}
