import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class CustomDropdown extends StatelessWidget {
  CustomDropdown({
    super.key,
    required this.items,
    this.hintText,
    this.itemStyle, required String selectedValue, required Null Function(dynamic newValue) onChanged,
  });

  final List<String> items;
  final String? hintText;
  final TextStyle? itemStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colorconst.cGrey)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              hintText ?? 'None',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: itemStyle ??
                            TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ))
                .toList(),
            value: "No Selected ",
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}
