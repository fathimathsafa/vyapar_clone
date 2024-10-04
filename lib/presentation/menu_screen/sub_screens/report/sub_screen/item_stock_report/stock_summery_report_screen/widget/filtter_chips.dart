import 'package:flutter/material.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/item_stock_report/stock_summery_report_screen/widget/filtter_chip_widget.dart';

class FilterChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilterChipWidget('Item Category - All'),
        FilterChipWidget('Stock - All'),
        FilterChipWidget('Status - All'),
      ],
    );
  }
}
