class ItemModel {


    String? itemName;
    String? itemNum;
    String? price;
    String? quantity;
    String? total;
    String? tax;
    String? discount;
    String? subtotalP;
    String? discountP;
    String? unit;
    String? taxPercent;

    ItemModel({this.taxPercent, this.unit, this.subtotalP,this.discountP, this.itemName,this.itemNum,this.price,this.quantity,this.total,this.tax,this.discount});
}