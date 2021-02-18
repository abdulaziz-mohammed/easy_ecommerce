import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../services/services.dart';
import '../errors/errors.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(InitialProductState());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    try {
      if (event is FetchProduct) {
        yield ProductStateLoading();
        final item = await ProductService.instance.getProductById(id: event.id);
        yield ProductStateSuccess(item);
      }
    } on AuthTokenError catch (e) {
      yield ProductStateError(e);
    } on NetworkError catch (e) {
      yield ProductStateError(e);
    } catch (e) {
      yield ProductStateError(new AppError());
    }
  }
}
