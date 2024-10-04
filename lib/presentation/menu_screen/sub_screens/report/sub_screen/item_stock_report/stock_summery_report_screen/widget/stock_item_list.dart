import 'package:flutter/material.dart';
import 'package:vyapar_clone/presentation/common_screens/item_details_screen/view/item_details_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/stock_summery_report_screen/widget/stock_item_card.dart';

class StockItemList extends StatelessWidget {
  final List<Map<String, dynamic>> stockItems = [
    {"name": "Dss", "stockValue": "₹ 0.00", "stockQty": -5},
    {"name": "Ghee", "stockValue": "₹ 0.00", "stockQty": 5},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stockItems.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ItemDetailsScreen()));
          },
          child: StockItemCard(
            name: stockItems[index]["name"],
            stockValue: stockItems[index]["stockValue"],
            stockQty: stockItems[index]["stockQty"],
          ),
        );
      },
    );
  }
}
