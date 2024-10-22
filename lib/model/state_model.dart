

import 'dart:convert';

List<StateModel> stateModelFromJson(String str) => List<StateModel>.from(json.decode(str).map((x) => StateModel.fromJson(x)));

String stateModelToJson(List<StateModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateModel {
    String? id;
    String? code;
    String? name;

    StateModel({
        this.id,
        this.code,
        this.name,
    });

    factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["_id"],
        code: json["code"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "code": code,
        "name": name,
    };
}
