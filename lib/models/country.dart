class Country {
  final String id;
  final String name;

  Country({
    this.id,
    this.name,
  });

  Country copyWith({
    String id,
    String name,
  }) {
    return Country(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
