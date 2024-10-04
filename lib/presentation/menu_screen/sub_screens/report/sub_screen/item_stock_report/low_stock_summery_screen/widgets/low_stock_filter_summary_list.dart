import 'package:flutter/material.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/low_stock_summery_screen/widgets/low_stock_summery_card.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/stock_summery_report_screen/widget/summery_card_widget.dart';

class LowStockSummaryCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LowStockSummaryCard('Low Stock Items', '1', isLowStock: true),
        LowStockSummaryCard('Stock Value', '₹ 0.00'),
      ],
    );
  }
}
