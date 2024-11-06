// To parse this JSON data, do
//
//     final expenseModel = expenseModelFromJson(jsonString);

// import 'dart:convert';

// ExpenseModel expenseModelFromJson(String str) => ExpenseModel.fromJson(json.decode(str));

// String expenseModelToJson(ExpenseModel data) => json.encode(data.toJson());

class ExpenseModel {
  String? id;
  String? name;
  int? expenseAmount;

  ExpenseModel({
    this.id,
    this.name,
    this.expenseAmount,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        id: json["_id"],
        name: json["name"],
        expenseAmount: json["expenseAmount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "expenseAmount": expenseAmount,
      };
}
