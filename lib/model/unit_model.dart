

import 'dart:convert';

List<UnitModel> unitModelFromJson(String str) => List<UnitModel>.from(json.decode(str).map((x) => UnitModel.fromJson(x)));

String unitModelToJson(List<UnitModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnitModel {
    String? id;
    String? name;
    String? shortName;
    String? createdBy;

    UnitModel({
        this.id,
        this.name,
        this.shortName,
        this.createdBy,
    });

    factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
        id: json["_id"],
        name: json["name"],
        shortName: json["shortName"],
        createdBy: json["createdBy"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "shortName": shortName,
        "createdBy": createdBy,
    };
}
