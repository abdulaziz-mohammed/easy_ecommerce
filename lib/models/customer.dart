import 'dart:convert';

class Customer {
  final String id;
  final String token;
  final String firstName;
  final String lastName;
  final String profilePhoto;

  Customer(
    this.id,
    this.token,
    this.firstName,
    this.lastName,
    this.profilePhoto,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'token': token,
      'firstName': firstName,
      'lastName': lastName,
      'profilePhoto': profilePhoto,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Customer(
      map['id'],
      map['token'],
      map['firstName'],
      map['lastName'],
      map['profilePhoto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));
}
