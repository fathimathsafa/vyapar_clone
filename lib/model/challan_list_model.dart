
import 'dart:convert';

List<ChallanModel> challanModelFromJson(String str) => List<ChallanModel>.from(json.decode(str).map((x) => ChallanModel.fromJson(x)));

String challanModelToJson(List<ChallanModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChallanModel {
    String? id;
    int? challanNo;
    String? invoiceDate;
    double? totalAmount;
    String? status;

    ChallanModel({
        this.id,
        this.challanNo,
        this.invoiceDate,
        this.totalAmount,
        this.status,
    });

    factory ChallanModel.fromJson(Map<String, dynamic> json) => ChallanModel(
        id: json["_id"],
        challanNo: json["challanNo"],
        invoiceDate: json["invoiceDate"],
        totalAmount: json["totalAmount"]?.toDouble(),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "challanNo": challanNo,
        "invoiceDate": invoiceDate,
        "totalAmount": totalAmount,
        "status": status,
    };
}
