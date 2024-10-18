// party_model.dart
class PartyModel {
  final String name;
  final int partyBalance;

  PartyModel({required this.name, required this.partyBalance});

  factory PartyModel.fromJson(Map<String, dynamic> json) {
    return PartyModel(
      name: json['name'],
      partyBalance: json['partyBalance'],
    );
  }
}
