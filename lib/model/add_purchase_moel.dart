// purchase_model.dart

class Purchase {
  String partyName;
  String phoneNumber;
  double totalAmount;
  double receivedAmount;
  String state;
  String description;

  Purchase({
    required this.partyName,
    required this.phoneNumber,
    required this.totalAmount,
    required this.receivedAmount,
    required this.state,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'partyName': partyName,
      'phoneNumber': phoneNumber,
      'totalAmount': totalAmount,
      'receivedAmount': receivedAmount,
      'state': state,
      'description': description,
    };
  }

  factory Purchase.fromJson(Map<String, dynamic> json) {
    return Purchase(
      partyName: json['party_name'],
      phoneNumber: json['phone_number'],
      totalAmount: json['total_amount'],
      receivedAmount: json['received_amount'],
      state: json['state'],
      description: json['description'],
    );
  }
}
