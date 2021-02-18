import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../services/services.dart';
import '../errors/errors.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialHomeState());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try {
      if (event is FetchHome) {
        yield HomeStateLoading();
        var banners = BannerService.instance.getAll();
        var featured = ProductService.instance.getFeatured();
        var onSale = ProductService.instance.getOnsale();
        var categories = CategoryService.instance.getAll();

        Future.wait([banners, featured, onSale, categories]);

        yield HomeStateSuccess(
            banners: await banners,
            featured: await featured,
            onSale: await onSale,
            categories: await categories);
      }
    } on AuthTokenError catch (e) {
      yield HomeStateError(e);
    } on NetworkError catch (e) {
      yield HomeStateError(e);
    } catch (e) {
      yield HomeStateError(new AppError());
    }
  }
}
