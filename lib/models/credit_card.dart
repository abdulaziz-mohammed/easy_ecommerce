class CreditCard {
  final String id;
  final String fullName;
  final String number;
  final String expiration;
  final String ccv;
  final String issuingNetwork;

  CreditCard({
    this.id,
    this.fullName,
    this.number,
    this.expiration,
    this.ccv,
    this.issuingNetwork,
  });

  CreditCard copyWith({
    String id,
    String fullName,
    String number,
    String expiration,
    String ccv,
    String issuingNetwork,
  }) {
    return CreditCard(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      number: number ?? this.number,
      expiration: expiration ?? this.expiration,
      ccv: ccv ?? this.ccv,
      issuingNetwork: issuingNetwork ?? this.issuingNetwork,
    );
  }
}
