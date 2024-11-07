
import 'dart:convert';

List<PurchaseListModel> purchaseListModelFromJson(String str) => List<PurchaseListModel>.from(json.decode(str).map((x) => PurchaseListModel.fromJson(x)));

String purchaseListModelToJson(List<PurchaseListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PurchaseListModel {
    String? id;
    String? billNo;
    String? billDate;
    String? partyName;
    String? paymentMethod;
    BankName? bankName;
    double? totalAmount;
    double? balanceAmount;
    String? invoiceDate;

    PurchaseListModel({
        this.id,
        this.billNo,
        this.billDate,
        this.partyName,
        this.paymentMethod,
        this.bankName,
        this.totalAmount,
        this.balanceAmount,
        this.invoiceDate,
    });

    factory PurchaseListModel.fromJson(Map<String, dynamic> json) => PurchaseListModel(
        id: json["_id"],
        billNo: json["billNo"],
        billDate: json["billDate"],
        partyName: json["partyName"],
        paymentMethod: json["paymentMethod"],
        bankName: json["bankName"] == null ? null : BankName.fromJson(json["bankName"]),
        totalAmount: json["totalAmount"]?.toDouble(),
        balanceAmount: json["balanceAmount"]?.toDouble(),
        invoiceDate: json["invoiceDate"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "billNo": billNo,
        "billDate": billDate,
        "partyName": partyName,
        "paymentMethod": paymentMethod,
        "bankName": bankName?.toJson(),
        "totalAmount": totalAmount,
        "balanceAmount": balanceAmount,
        "invoiceDate": invoiceDate,
    };
}

class BankName {
    String? bankName;

    BankName({
        this.bankName,
    });

    factory BankName.fromJson(Map<String, dynamic> json) => BankName(
        bankName: json["bankName"],
    );

    Map<String, dynamic> toJson() => {
        "bankName": bankName,
    };
}
