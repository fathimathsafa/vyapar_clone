
import 'dart:convert';

List<InvoiceModel> invoiceModelFromJson(String str) => List<InvoiceModel>.from(json.decode(str).map((x) => InvoiceModel.fromJson(x)));

String invoiceModelToJson(List<InvoiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvoiceModel {
    String? invoiceNo;
    String? invoiceDate;
    String? partyName;
    PaymentMethod? paymentMethod;
    BankName? bankName;
    double? totalAmount;
    double? balanceAmount;

    InvoiceModel({
        this.invoiceNo,
        this.invoiceDate,
        this.partyName,
        this.paymentMethod,
        this.bankName,
        this.totalAmount,
        this.balanceAmount,
    });

    factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
        invoiceNo: json["invoiceNo"],
        invoiceDate: json["invoiceDate"],
        partyName: json["partyName"],
        paymentMethod: paymentMethodValues.map[json["paymentMethod"]]!,
        bankName: json["bankName"] == null ? null : BankName.fromJson(json["bankName"]),
        totalAmount: json["totalAmount"]?.toDouble(),
        balanceAmount: json["balanceAmount"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "invoiceNo": invoiceNo,
        "invoiceDate": invoiceDateValues.reverse[invoiceDate],
        "partyName": partyNameValues.reverse[partyName],
        "paymentMethod": paymentMethodValues.reverse[paymentMethod],
        "bankName": bankName?.toJson(),
        "totalAmount": totalAmount,
        "balanceAmount": balanceAmount,
    };
}

class BankName {
    PaymentMethod? bankName;

    BankName({
        this.bankName,
    });

    factory BankName.fromJson(Map<String, dynamic> json) => BankName(
        bankName: paymentMethodValues.map[json["bankName"]]!,
    );

    Map<String, dynamic> toJson() => {
        "bankName": paymentMethodValues.reverse[bankName],
    };
}

enum PaymentMethod {
    AXIS_BANK,
    CASH
}

final paymentMethodValues = EnumValues({
    "Axis Bank": PaymentMethod.AXIS_BANK,
    "Cash": PaymentMethod.CASH
});

enum InvoiceDate {
    THE_03102024,
    THE_10102024,
    THE_19102024,
    THE_20092024,
    THE_21102024
}

final invoiceDateValues = EnumValues({
    "03/10/2024": InvoiceDate.THE_03102024,
    "10/10/2024": InvoiceDate.THE_10102024,
    "19/10/2024": InvoiceDate.THE_19102024,
    "20/09/2024": InvoiceDate.THE_20092024,
    "21/10/2024": InvoiceDate.THE_21102024
});

enum PartyName {
    AK_TRADERS,
    PARTY_NAME_AK_TRADERS,
    R_K_FABRICS,
    STAR_BAKERS
}

final partyNameValues = EnumValues({
    "AK Traders": PartyName.AK_TRADERS,
    "\"AK Traders\"": PartyName.PARTY_NAME_AK_TRADERS,
    "R.K. Fabrics": PartyName.R_K_FABRICS,
    "Star Bakers": PartyName.STAR_BAKERS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
