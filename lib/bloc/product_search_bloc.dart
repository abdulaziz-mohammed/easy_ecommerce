import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../services/services.dart';
import '../errors/errors.dart';

class ProductSearchBloc extends Bloc<ProductSearchEvent, ProductSearchState> {
  ProductSearchBloc() : super(ProductSearchStateInitial());

  @override
  Stream<ProductSearchState> mapEventToState(
    ProductSearchEvent event,
  ) async* {
    try {
      if (event is Search) {
        yield ProductSearchStateLoading();
        final items = await ProductService.instance
            .getProductsByQuery(query: event.query);
        yield ProductSearchStateSuccess(event.query, items);
      }
      // if (event is EditQuery) {
      //   yield ProductSearchStateEditQuery(event.query);
      // }
    } on AuthTokenError catch (e) {
      yield ProductSearchStateError(e);
    } on NetworkError catch (e) {
      yield ProductSearchStateError(e);
    } catch (e) {
      yield ProductSearchStateError(new AppError());
    }
  }
}
