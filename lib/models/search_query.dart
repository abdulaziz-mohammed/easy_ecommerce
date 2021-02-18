import 'package:equatable/equatable.dart';

class SearchQuery extends Equatable {
  final String keyword;
  final String categoryId;
  final bool featured;
  final bool onSale;

  final String page;
  final int pageSize;

  SearchQuery(
      {this.keyword,
      this.categoryId,
      this.featured,
      this.onSale,
      this.page,
      this.pageSize = 10});

  SearchQuery copyWith({
    String keyword,
    String categoryId,
    bool featured,
    bool onSale,
    String page,
    int pageSize,
  }) {
    return SearchQuery(
      keyword: keyword ?? this.keyword,
      categoryId: categoryId ?? this.categoryId,
      featured: featured ?? this.featured,
      onSale: onSale ?? this.onSale,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  List<Object> get props =>
      [keyword, categoryId, featured, onSale, page, pageSize];
}
