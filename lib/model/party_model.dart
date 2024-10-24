

import 'dart:convert';

List<PartyModel> partyModelFromJson(String str) => List<PartyModel>.from(json.decode(str).map((x) => PartyModel.fromJson(x)));

String partyModelToJson(List<PartyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PartyModel {
    String? name;
    String? value;
    String? label;
    double? partyBalance;
    String? address;

    PartyModel({
        this.name,
        this.value,
        this.label,
        this.partyBalance,
        this.address,
    });

    factory PartyModel.fromJson(Map<String, dynamic> json) => PartyModel(
        name: json["name"],
        value: json["value"],
        label: json["label"],
        partyBalance: json["partyBalance"]?.toDouble(),
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "label": label,
        "partyBalance": partyBalance,
        "address": address,
    };
}
