
import 'dart:convert';

SaleDetailModel saleDetailModelFromJson(String str) => SaleDetailModel.fromJson(json.decode(str));

String saleDetailModelToJson(SaleDetailModel data) => json.encode(data.toJson());

class SaleDetailModel {
  String? id;
    String? invoiceNo;
    String? invoiceType;
    String? invoiceDate;
    String? party;
    String? partyName;
    String? document;
    String? image;
    String? paymentMethod;
    dynamic bankName;
    List<Item>? items;
    double? roundOff;
    double? totalAmount;
    double? receivedAmount;
    double? balanceAmount;
    String? createdBy;
    String? source;
    String? createdAt;
    String? updatedAt;
    int? v;

    SaleDetailModel({
      this.id,
        this.invoiceNo,
        this.invoiceType,
        this.invoiceDate,
        this.party,
        this.partyName,
        this.document,
        this.image,
        this.paymentMethod,
        this.bankName,
        this.items,
        this.roundOff,
        this.totalAmount,
        this.receivedAmount,
        this.balanceAmount,
        this.createdBy,
        this.source,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory SaleDetailModel.fromJson(Map<String, dynamic> json) => SaleDetailModel(
        invoiceNo: json["invoiceNo"]??"",
        invoiceType: json["invoiceType"]??"",
        invoiceDate: json["invoiceDate"],
        party: json["party"],
        partyName: json["partyName"],
        document: json["document"],
        image: json["image"],
        paymentMethod: json["paymentMethod"],
        bankName: json["bankName"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        roundOff: json["roundOff"],
        totalAmount: json["totalAmount"]?.toDouble(),
        receivedAmount: json["receivedAmount"]?.toDouble(),
        balanceAmount: json["balanceAmount"],
        createdBy: json["createdBy"],
        source: json["source"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "invoiceNo": invoiceNo,
        "invoiceType": invoiceType,
        "invoiceDate": invoiceDate,
        "party": party,
        "partyName": partyName,
        "document": document,
        "image": image,
        "paymentMethod": paymentMethod,
        "bankName": bankName,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "roundOff": roundOff,
        "totalAmount": totalAmount,
        "receivedAmount": receivedAmount,
        "balanceAmount": balanceAmount,
        "createdBy": createdBy,
        "source": source,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}

class Item {
    ItemId? itemId;
    int? quantity;
    Unit? unit;
    int? price;
    int? discountPercent;
    TaxPercent? taxPercent;
    double? finalAmount;
    String? id;

    Item({
        this.itemId,
        this.quantity,
        this.unit,
        this.price,
        this.discountPercent,
        this.taxPercent,
        this.finalAmount,
        this.id,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["itemId"] == null ? null : ItemId.fromJson(json["itemId"]),
        quantity: json["quantity"],
        unit: json["unit"] == null ? null : Unit.fromJson(json["unit"]),
        price: json["price"],
        discountPercent: json["discountPercent"],
        taxPercent: json["taxPercent"] == null ? null : TaxPercent.fromJson(json["taxPercent"]),
        finalAmount: json["finalAmount"]?.toDouble(),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "itemId": itemId?.toJson(),
        "quantity": quantity,
        "unit": unit?.toJson(),
        "price": price,
        "discountPercent": discountPercent,
        "taxPercent": taxPercent?.toJson(),
        "finalAmount": finalAmount,
        "_id": id,
    };
}

class ItemId {
    String? itemName;

    ItemId({
        this.itemName,
    });

    factory ItemId.fromJson(Map<String, dynamic> json) => ItemId(
        itemName: json["itemName"],
    );

    Map<String, dynamic> toJson() => {
        "itemName": itemName,
    };
}

class TaxPercent {
    String? id;
    String? taxType;
    String? rate;

    TaxPercent({
        this.id,
        this.taxType,
        this.rate,
    });

    factory TaxPercent.fromJson(Map<String, dynamic> json) => TaxPercent(
        id: json["_id"],
        taxType: json["taxType"],
        rate: json["rate"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "taxType": taxType,
        "rate": rate,
    };
}

class Unit {
    String? name;

    Unit({
        this.name,
    });

    factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
