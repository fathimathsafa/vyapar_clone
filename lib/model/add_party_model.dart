class Party {
  final String name;
  final String gstIn;
  final String gstType;
  final String email;
  final String phone;
  final String state;
  final String billingAddress;
  final String shippingAddress;
  final double openingBalance;
  final String asOfDate;
  final String balanceType;
  final String additionalField1;
  final String additionalField2;
  final String additionalField3;

  Party({
    required this.name,
    required this.gstIn,
    required this.gstType,
    required this.email,
    required this.phone,
    required this.state,
    required this.billingAddress,
    required this.shippingAddress,
    required this.openingBalance,
    required this.asOfDate,
    required this.balanceType,
    required this.additionalField1,
    required this.additionalField2,
    required this.additionalField3,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "gstIn": gstIn,
      "gstType": gstType,
      "email": email,
      "phone": phone,
      "state": state,
      "billingAddress": billingAddress,
      "shippingAddress": shippingAddress,
      "openingBalance": openingBalance,
      "asOfDate": asOfDate,
      "balanceType": balanceType,
      "additionalField1": additionalField1,
      "additionalField2": additionalField2,
      "additionalField3": additionalField3,
    };
  }
}
