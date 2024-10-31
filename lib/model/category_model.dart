
import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
    String? id;
    String? name;
    String? createdBy;

    CategoryModel({
        this.id,
        this.name,
        this.createdBy,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        name: json["name"],
        createdBy: json["createdBy"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "createdBy": createdBy,
    };
}
