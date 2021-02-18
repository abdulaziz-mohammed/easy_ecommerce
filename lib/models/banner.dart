import '../models/models.dart';

class Banner {
  final String title;
  final String photo;
  final SearchQuery query;

  Banner({
    this.title,
    this.photo,
    this.query,
  });

  Banner copyWith({
    String title,
    String photo,
    SearchQuery query,
  }) {
    return Banner(
      title: title ?? this.title,
      photo: photo ?? this.photo,
      query: query ?? this.query?.copyWith(),
    );
  }
}
