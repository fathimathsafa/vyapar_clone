
import 'dart:convert';

List<PaymentOutModel> paymentOutModelFromJson(String str) => List<PaymentOutModel>.from(json.decode(str).map((x) => PaymentOutModel.fromJson(x)));

String paymentOutModelToJson(List<PaymentOutModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentOutModel {
    String? id;
    String? receiptNo;
    String? date;
    String? partyName;
    int? paidAmount;

    PaymentOutModel({
        this.id,
        this.receiptNo,
        this.date,
        this.partyName,
        this.paidAmount,
    });

    factory PaymentOutModel.fromJson(Map<String, dynamic> json) => PaymentOutModel(
        id: json["_id"],
        receiptNo: json["receiptNo"],
        date: json["date"],
        partyName: json["partyName"],
        paidAmount: json["paidAmount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "receiptNo": receiptNo,
        "date": date,
        "partyName": partyName,
        "paidAmount": paidAmount,
    };
}
