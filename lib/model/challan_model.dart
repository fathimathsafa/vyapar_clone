
import 'dart:convert';

ChallanNoModel challanNoModelFromJson(String str) => ChallanNoModel.fromJson(json.decode(str));

String challanNoModelToJson(ChallanNoModel data) => json.encode(data.toJson());

class ChallanNoModel {
    String? id;
    int? challanNo;

    ChallanNoModel({
        this.id,
        this.challanNo,
    });

    factory ChallanNoModel.fromJson(Map<String, dynamic> json) => ChallanNoModel(
        id: json["_id"],
        challanNo: json["challanNo"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "challanNo": challanNo,
    };
}
