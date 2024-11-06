// To parse this JSON data, do
//
//     final addExpenseModel = addExpenseModelFromJson(jsonString);

// import 'dart:convert';

// AddExpenseModel addExpenseModelFromJson(String str) => AddExpenseModel.fromJson(json.decode(str));

// String addExpenseModelToJson(AddExpenseModel data) => json.encode(data.toJson());

class AddExpenseModel {
  String? name;
  String? type;
  int? expenseAmount;
  String? createdBy;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  AddExpenseModel({
    this.name,
    this.type,
    this.expenseAmount,
    this.createdBy,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AddExpenseModel.fromJson(Map<String, dynamic> json) =>
      AddExpenseModel(
        name: json["name"] ?? '',
        type: json["type"] ?? '',
        expenseAmount: json["expenseAmount"] ?? '',
        createdBy: json["createdBy"] ?? '',
        id: json["_id"] ?? '',
        createdAt: json["createdAt"] ?? '',
        updatedAt: json["updatedAt"] ?? '',
        v: json["__v"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "expenseAmount": expenseAmount,
        "createdBy": createdBy,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
