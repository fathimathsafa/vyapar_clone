
import 'dart:convert';

List<CashFlowReportModel> cashFlowReportModelFromJson(String str) => List<CashFlowReportModel>.from(json.decode(str).map((x) => CashFlowReportModel.fromJson(x)));

String cashFlowReportModelToJson(List<CashFlowReportModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CashFlowReportModel {
    String? id;
    DateTime? transactionDate;
    String? partyName;
    String? referenceNo;
    String? type;
    double? creditAmount;
    int? debitAmount;
    double? runningCashInHand;

    CashFlowReportModel({
        this.id,
        this.transactionDate,
        this.partyName,
        this.referenceNo,
        this.type,
        this.creditAmount,
        this.debitAmount,
        this.runningCashInHand,
    });

    factory CashFlowReportModel.fromJson(Map<String, dynamic> json) => CashFlowReportModel(
        id: json["_id"],
        transactionDate: json["transactionDate"] == null ? null : DateTime.parse(json["transactionDate"]),
        partyName: json["partyName"],
        referenceNo: json["referenceNo"],
        type: json["type"],
        creditAmount: json["credit_Amount"]?.toDouble(),
        debitAmount: json["debit_Amount"],
        runningCashInHand: json["runningCashInHand"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "transactionDate": transactionDate?.toIso8601String(),
        "partyName": partyName,
        "referenceNo": referenceNo,
        "type": type,
        "credit_Amount": creditAmount,
        "debit_Amount": debitAmount,
        "runningCashInHand": runningCashInHand,
    };
}
