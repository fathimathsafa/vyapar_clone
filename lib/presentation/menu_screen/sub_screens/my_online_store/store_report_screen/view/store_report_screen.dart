import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart'; // Ensure the color constants are well defined
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreReportScreen extends StatelessWidget {
  final DateTime selectedDate;
  final DateTime firstDate;
  final DateTime lastDate;

  StoreReportScreen({
    Key? key,
    DateTime? selectedDate,
    DateTime? firstDate,
    DateTime? lastDate,
  })  : selectedDate = selectedDate ?? DateTime.now(),
        firstDate =
            firstDate ?? DateTime.now().subtract(const Duration(days: 30)),
        lastDate = lastDate ?? DateTime.now().add(const Duration(days: 30)),
        super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      // Handle the date change via a parent widget or state management
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final List<IconData> icons = [
      Icons.currency_rupee,
      Icons.visibility_outlined,
      Icons.format_list_numbered_rounded,
      Icons.padding_outlined
    ];

    final List<String> titleTexts = [
      'Order Value',
      'Store Views',
      'Orders Received',
      'Most Ordered Items'
    ];

    final List<String> subtitleTexts = ['₹ 0.00', '0', '0', '1 - 30 Aug'];

    final String centerText = 'Unable to generate reports';
    final String subcenterText = 'No data available for selected time frame';

    return Scaffold(
      backgroundColor: Colorconst.cBluelight,
      appBar: AppBar(
        backgroundColor: Colorconst.cwhite,
        title: const Text(
          'Store Report',
          style: TextStyle(
            color: Colorconst.cBlack,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(screenWidth * .01),
            color: Colors.white,
            child: Row(
              children: [
                Text(
                  "This Month",
                  style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                Container(
                  height: screenHeight * .04,
                  width: 2,
                  color: Colorconst.cBlack,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.calendar_today,
                    color: Colorconst.cBlue,
                  ),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
                SizedBox(width: screenWidth * .01),
                Text(
                  "${DateFormat('MM/dd/yyyy').format(firstDate)} To ${DateFormat('MM/dd/yyyy').format(lastDate)}",
                  style: TextStyle(fontSize: 14.sp, color: Colorconst.cBlack),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 4, // 4 items in the list
                itemBuilder: (context, index) {
                  return Card(
                    color: Colorconst.cwhite,
                    elevation: 2,
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * .03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colorconst.cBluelight,
                                radius: 20.r,
                                child: Icon(
                                  icons[index],
                                  color: Colorconst.cBlue,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        titleTexts[index],
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colorconst.cGrey),
                                      ),
                                      Icon(
                                        Icons.info_outline,
                                        color: Colorconst.cGrey,
                                        size: 17.sp,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    subtitleTexts[index],
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colorconst.cBlack),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colorconst.cPink,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  'Show Orders',
                                  style: TextStyle(color: Colorconst.cRed),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * .15),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  centerText,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colorconst.cBlack),
                                ),
                                Text(
                                  subcenterText,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colorconst.cGrey),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight * .15),
                          Center(
                            child: Text(
                              "Showing reports of This Month",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
