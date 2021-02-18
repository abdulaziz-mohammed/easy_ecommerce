class Address {
  final String id;
  final String fullName;
  final String line1;
  final String line2;
  final String city;
  final String country;
  final String zip;
  final String phone;

  Address({
    this.id,
    this.fullName,
    this.line1,
    this.line2,
    this.city,
    this.country,
    this.zip,
    this.phone,
  });

  Address copyWith({
    String id,
    String fullName,
    String line1,
    String line2,
    String city,
    String country,
    String zip,
    String phone,
  }) {
    return Address(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      line1: line1 ?? this.line1,
      line2: line2 ?? this.line2,
      city: city ?? this.city,
      country: country ?? this.country,
      zip: zip ?? this.zip,
      phone: phone ?? this.phone,
    );
  }
}
