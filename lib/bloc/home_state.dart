import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../models/models.dart';

@immutable
abstract class HomeState extends Equatable {}

class InitialHomeState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeStateLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeStateSuccess extends HomeState {
  final List<Banner> banners;
  final List<Product> featured;
  final List<Product> onSale;
  final List<Category> categories;

  HomeStateSuccess({this.banners, this.featured, this.onSale, this.categories});

  @override
  List<Object> get props => [banners, featured, onSale, categories];
}

class HomeStateError extends HomeState {
  final Error error;

  HomeStateError(this.error);

  @override
  List<Object> get props => [error];
}
