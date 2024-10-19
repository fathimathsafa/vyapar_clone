
import 'dart:convert';

List<TaxModel> taxModelFromJson(String str) => List<TaxModel>.from(json.decode(str).map((x) => TaxModel.fromJson(x)));

String taxModelToJson(List<TaxModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaxModel {
    String? id;
    String? taxType;
    String? rate;

    TaxModel({
        this.id,
        this.taxType,
        this.rate,
    });

    factory TaxModel.fromJson(Map<String, dynamic> json) => TaxModel(
        id: json["_id"],
        taxType: json["taxType"],
        rate: json["rate"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "taxType": taxType,
        "rate": rate,
    };
}
