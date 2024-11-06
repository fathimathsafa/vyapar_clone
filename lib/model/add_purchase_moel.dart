// To parse this JSON data, do
//
//     final addPurchaseModel = addPurchaseModelFromJson(jsonString);

import 'dart:convert';

AddPurchaseModel addPurchaseModelFromJson(String str) =>
    AddPurchaseModel.fromJson(json.decode(str));

String addPurchaseModelToJson(AddPurchaseModel data) =>
    json.encode(data.toJson());

class AddPurchaseModel {
  String? billNo;
  DateTime? billDate;
  String? stateOfSupply;
  String? party;
  String? partyName;
  String? phoneNo;
  String? description;
  String? image;
  String? paymentMethod;
  String? bankName;
  List<Item>? items;
  int? roundOff;
  int? totalAmount;
  int? paidAmount;
  int? balanceAmount;
  String? createdBy;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  AddPurchaseModel({
    this.billNo,
    this.billDate,
    this.stateOfSupply,
    this.party,
    this.partyName,
    this.phoneNo,
    this.description,
    this.image,
    this.paymentMethod,
    this.bankName,
    this.items,
    this.roundOff,
    this.totalAmount,
    this.paidAmount,
    this.balanceAmount,
    this.createdBy,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AddPurchaseModel.fromJson(Map<String, dynamic> json) =>
      AddPurchaseModel(
        billNo: json["billNo"],
        billDate:
            json["billDate"] == null ? null : DateTime.parse(json["billDate"]),
        stateOfSupply: json["stateOfSupply"],
        party: json["party"],
        partyName: json["partyName"],
        phoneNo: json["phoneNo"],
        description: json["description"],
        image: json["image"],
        paymentMethod: json["paymentMethod"],
        bankName: json["bankName"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        roundOff: json["roundOff"],
        totalAmount: json["totalAmount"],
        paidAmount: json["paidAmount"],
        balanceAmount: json["balanceAmount"],
        createdBy: json["createdBy"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "billNo": billNo,
        "billDate": billDate?.toIso8601String(),
        "stateOfSupply": stateOfSupply,
        "party": party,
        "partyName": partyName,
        "phoneNo": phoneNo,
        "description": description,
        "image": image,
        "paymentMethod": paymentMethod,
        "bankName": bankName,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "roundOff": roundOff,
        "totalAmount": totalAmount,
        "paidAmount": paidAmount,
        "balanceAmount": balanceAmount,
        "createdBy": createdBy,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Item {
  String? itemId;
  int? quantity;
  String? unit;
  int? price;
  int? discountPercent;
  String? taxPercent;
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
        itemId: json["itemId"],
        quantity: json["quantity"],
        unit: json["unit"],
        price: json["price"],
        discountPercent: json["discountPercent"],
        taxPercent: json["taxPercent"],
        finalAmount: json["finalAmount"]?.toDouble(),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "quantity": quantity,
        "unit": unit,
        "price": price,
        "discountPercent": discountPercent,
        "taxPercent": taxPercent,
        "finalAmount": finalAmount,
        "_id": id,
      };
}
