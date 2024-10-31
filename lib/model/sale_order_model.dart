
import 'dart:convert';

List<SaleOrderModel> saleOrderModelFromJson(String str) => List<SaleOrderModel>.from(json.decode(str).map((x) => SaleOrderModel.fromJson(x)));

String saleOrderModelToJson(List<SaleOrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SaleOrderModel {
    int? orderNo;
    String? orderDate;
    String? partyName;
    int? totalAmount;
    int? balanceAmount;

    SaleOrderModel({
        this.orderNo,
        this.orderDate,
        this.partyName,
        this.totalAmount,
        this.balanceAmount,
    });

    factory SaleOrderModel.fromJson(Map<String, dynamic> json) => SaleOrderModel(
        orderNo: json["orderNo"],
        orderDate: json["orderDate"],
        partyName: json["partyName"],
        totalAmount: json["totalAmount"],
        balanceAmount: json["balanceAmount"],
    );

    Map<String, dynamic> toJson() => {
        "orderNo": orderNo,
        "orderDate": orderDate,
        "partyName": partyName,
        "totalAmount": totalAmount,
        "balanceAmount": balanceAmount,
    };
}
