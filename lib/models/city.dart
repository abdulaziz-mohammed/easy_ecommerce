class City {
  final String id;
  final String name;

  City({
    this.id,
    this.name,
  });

  City copyWith({
    String id,
    String name,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
