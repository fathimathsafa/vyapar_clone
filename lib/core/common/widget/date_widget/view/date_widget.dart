import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Ensure you have this import for responsive sizes
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/widget/date_widget/controller/date_controller.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart'; // Ensure you have this import for GetX

class DateDropdownAndPicker extends StatelessWidget {
  final DateController controller = Get.put(DateController());

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.only(left: 6.w, right: 6.w),
        child: Row(
          children: [
            Obx(
              () => DropdownButtonHideUnderline( 
                child: DropdownButton<String>(     
                  value: controller.dropdownValue.value,
                  icon: Icon(Icons.arrow_drop_down,
                      size: 25.sp, color: Colorconst.cBlue),
                  onChanged: (String? newValue) {
                    controller.updateDropdownValue(newValue!);
                  },
                  items: <String>[
                    "Today",
                    'This Month',
                    "This Quarter",
                    'Custom'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: 14.sp, color: Colorconst.cBlack),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(width: 10.w), // Responsive width
            const VerticalDivider(color: Colors.grey),
            IconButton(
              icon: const Icon(Icons.calendar_today, color: Colorconst.cBlue),
              onPressed: () {
                controller.selectDateRange(context);
              },
            ),
            Obx(
              () => GestureDetector(
                onTap: () {
                  controller.selectDateRange(context);
                },   
                child: Text(
                  "${controller.startDate} To ${controller.endDate}",
                  style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
                                