
import 'dart:convert';

List<ItemBarList> itemBarListFromJson(String str) => List<ItemBarList>.from(json.decode(str).map((x) => ItemBarList.fromJson(x)));

String itemBarListToJson(List<ItemBarList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemBarList {
    Discount? discount;
    Stock? stock;
    String? id;
    String? itemName;
    int? salePrice;
    bool? salePriceIncludesTax;
    int? purchasePrice;
    bool? purchasePriceIncludesTax;
    // List<dynamic>? image;
    CreatedBy? createdBy;
    int? v;

    ItemBarList({
        this.discount,
        this.stock,
        this.id,
        this.itemName,
        this.salePrice,
        this.salePriceIncludesTax,
        this.purchasePrice,
        this.purchasePriceIncludesTax,
        // this.image,
        // this.createdBy,
        this.v,
    });

    factory ItemBarList.fromJson(Map<String, dynamic> json) => ItemBarList(
        discount: json["discount"] == null ? null : Discount.fromJson(json["discount"]),
        stock: json["stock"] == null ? null : Stock.fromJson(json["stock"]),
        id: json["_id"],
        itemName: json["itemName"],
        salePrice: json["salePrice"],
        salePriceIncludesTax: json["salePriceIncludesTax"],
        purchasePrice: json["purchasePrice"],
        purchasePriceIncludesTax: json["purchasePriceIncludesTax"],
        // image: json["image"] == null ? [] : List<dynamic>.from(json["image"]!.map((x) => x)),
        // createdBy: createdByValues.map[json["createdBy"]]!,
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "discount": discount?.toJson(),
        "stock": stock?.toJson(),
        "_id": id,
        "itemName": itemName,
        "salePrice": salePrice,
        "salePriceIncludesTax": salePriceIncludesTax,
        "purchasePrice": purchasePrice,
        "purchasePriceIncludesTax": purchasePriceIncludesTax,
        // "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "createdBy": createdByValues.reverse[createdBy],
        "__v": v,
    };
}

enum CreatedBy {
    THE_670_CB38_B50_C67388_E2_FD00_DE
}

final createdByValues = EnumValues({
    "670cb38b50c67388e2fd00de": CreatedBy.THE_670_CB38_B50_C67388_E2_FD00_DE
});

class Discount {
    int? value;
    Type? type;

    Discount({
        this.value,
        this.type,
    });

    factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        value: json["value"],
        type: typeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "type": typeValues.reverse[type],
    };
}

enum Type {
    PERCENTAGE
}

final typeValues = EnumValues({
    "percentage": Type.PERCENTAGE
});

class Stock {
    int? purchaseQuantity;
    int? price;
    int? openingQuantity;
    int? saleQuantity;
    int? minStockToMaintain;
    DateTime? lastUpdated;
    int? totalQuantity;

    Stock({
        this.purchaseQuantity,
        this.price,
        this.openingQuantity,
        this.saleQuantity,
        this.minStockToMaintain,
        this.lastUpdated,
        this.totalQuantity,
    });

    factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        purchaseQuantity: json["purchaseQuantity"],
        price: json["price"],
        openingQuantity: json["openingQuantity"],
        saleQuantity: json["saleQuantity"],
        minStockToMaintain: json["minStockToMaintain"],
        lastUpdated: json["lastUpdated"] == null ? null : DateTime.parse(json["lastUpdated"]),
        totalQuantity: json["totalQuantity"],
    );

    Map<String, dynamic> toJson() => {
        "purchaseQuantity": purchaseQuantity,
        "price": price,
        "openingQuantity": openingQuantity,
        "saleQuantity": saleQuantity,
        "minStockToMaintain": minStockToMaintain,
        "lastUpdated": lastUpdated?.toIso8601String(),
        "totalQuantity": totalQuantity,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
