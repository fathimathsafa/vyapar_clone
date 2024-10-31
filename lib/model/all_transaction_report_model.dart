
import 'dart:convert';

List<AllTransactionReportModel> allTransactionReportModelFromJson(String str) => List<AllTransactionReportModel>.from(json.decode(str).map((x) => AllTransactionReportModel.fromJson(x)));

String allTransactionReportModelToJson(List<AllTransactionReportModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllTransactionReportModel {
    Reference? reference;
    String? id;
    TransactionType? transactionType;
    Party? party;
    double? totalAmount;
    double? creditAmount;
    int? debitAmount;
    double? balance;
    String? transactionDate;

    AllTransactionReportModel({
        this.reference,
        this.id,
        this.transactionType,
        this.party,
        this.totalAmount,
        this.creditAmount,
        this.debitAmount,
        this.balance,
        this.transactionDate,
    });

    factory AllTransactionReportModel.fromJson(Map<String, dynamic> json) => AllTransactionReportModel(
        reference: json["reference"] == null ? null : Reference.fromJson(json["reference"]),
        id: json["_id"],
        transactionType: transactionTypeValues.map[json["transactionType"]]!,
        party: json["party"] == null ? null : Party.fromJson(json["party"]),
        totalAmount: json["totalAmount"]?.toDouble(),
        creditAmount: json["credit_amount"]?.toDouble(),
        debitAmount: json["debit_amount"],
        balance: json["balance"]?.toDouble(),
        transactionDate: json["transactionDate"],
    );

    Map<String, dynamic> toJson() => {
        "reference": reference?.toJson(),
        "_id": id,
        "transactionType": transactionTypeValues.reverse[transactionType],
        "party": party?.toJson(),
        "totalAmount": totalAmount,
        "credit_amount": creditAmount,
        "debit_amount": debitAmount,
        "balance": balance,
        "transactionDate": transactionDate,
    };
}

class Party {
    String? id;
    String? name;

    Party({
        this.id,
        this.name,
    });

    factory Party.fromJson(Map<String, dynamic> json) => Party(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}

class Reference {
    String? documentNumber;

    Reference({
        this.documentNumber,
    });

    factory Reference.fromJson(Map<String, dynamic> json) => Reference(
        documentNumber: json["documentNumber"],
    );

    Map<String, dynamic> toJson() => {
        "documentNumber": documentNumber,
    };
}

enum TransactionType {
    DELIVERY_CHALLAN,
    ESTIMATE,
    PAYMENT_IN,
    PAYMENT_OUT,
    PURCHASE,
    SALE,
    SALE_ORDER
}

final transactionTypeValues = EnumValues({
    "Delivery Challan": TransactionType.DELIVERY_CHALLAN,
    "Estimate": TransactionType.ESTIMATE,
    "Payment-In": TransactionType.PAYMENT_IN,
    "Payment-Out": TransactionType.PAYMENT_OUT,
    "Purchase": TransactionType.PURCHASE,
    "Sale": TransactionType.SALE,
    "Sale Order": TransactionType.SALE_ORDER
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
