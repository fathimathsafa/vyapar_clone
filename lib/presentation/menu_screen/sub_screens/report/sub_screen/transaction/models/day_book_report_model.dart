
import 'dart:convert';

List<DayBookReportModel> dayBookReportModelFromJson(String str) => List<DayBookReportModel>.from(json.decode(str).map((x) => DayBookReportModel.fromJson(x)));

String dayBookReportModelToJson(List<DayBookReportModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DayBookReportModel {
    String? id;
    DateTime? transactionDate;
    String? partyName;
    String? referenceNo;
    String? type;
    int? creditAmount;
    int? debitAmount;

    DayBookReportModel({
        this.id,
        this.transactionDate,
        this.partyName,
        this.referenceNo,
        this.type,
        this.creditAmount,
        this.debitAmount,
    });

    factory DayBookReportModel.fromJson(Map<String, dynamic> json) => DayBookReportModel(
        id: json["_id"],
        transactionDate: json["transactionDate"] == null ? null : DateTime.parse(json["transactionDate"]),
        partyName: json["partyName"],
        referenceNo: json["referenceNo"],
        type: json["type"],
        creditAmount: json["credit_Amount"],
        debitAmount: json["debit_Amount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "transactionDate": transactionDate?.toIso8601String(),
        "partyName": partyName,
        "referenceNo": referenceNo,
        "type": type,
        "credit_Amount": creditAmount,
        "debit_Amount": debitAmount,
    };
}
