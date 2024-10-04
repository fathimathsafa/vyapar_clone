import 'package:flutter/material.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/stock_summery_report_screen/widget/summery_card_widget.dart';

class SummaryCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SummaryCard('No. of Items', '2'),
        SummaryCard('Low Stock Items', '1', isLowStock: true),
        SummaryCard('Stock Value', '₹ 0.00'),
      ],
    );
  }
}
