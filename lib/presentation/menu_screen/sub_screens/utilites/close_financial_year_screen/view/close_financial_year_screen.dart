import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/close_financial_year_screen/sub_screens/change_prefixes_screen/view/change_prefixes_screen.dart';

class VyaparScreen extends StatefulWidget {
  const VyaparScreen({Key? key}) : super(key: key);

  @override
  State<VyaparScreen> createState() => _VyaparScreenState();
}

class _VyaparScreenState extends State<VyaparScreen> {
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the text form field with the current date
    _dateController.text = formatDate(DateTime.now());
  }

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); // Initialize ScreenUtil

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colorconst.cwhite),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text('Vyapar', style: TextStyle(color: Colorconst.cwhite)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the container
              borderRadius: BorderRadius.zero,
              // Optional, to give rounded corners
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.grey.withOpacity(0.5), // Shadow color with opacity
                  spreadRadius: 5, // How far the shadow spreads
                  blurRadius: 7, // The blur radius
                  offset: Offset(0,
                      3), // Offset: X-axis and Y-axis (controls shadow position)
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Text(
                    'Watch how to close books in Vyapar',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colorconst.cBlack),
                  ),
                ),
                SizedBox(height: 16.h), // Spacing between text and card
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Card(
                    color: Colorconst.cSecondaryGrey,
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              'https://ecommercephotographyindia.com/info/wp-content/uploads/2021/09/Cover-Product-demo-video-guide.jpg', // Replace with your image
                              width: 50.w,
                              height: 50.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              width: 16.w), // Spacing between image and text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Watch this video',
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colorconst.cGrey),
                                ),
                                SizedBox(
                                    height: 8
                                        .h), // Spacing between text and buttons
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colorconst.cwhite,
                                        side: const BorderSide(
                                            color: Colorconst.cRed),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.video_call,
                                              color: Colorconst.cRed),
                                          SizedBox(width: 4.w),
                                          Text('Hindi',
                                              style: TextStyle(
                                                  color: Colorconst.cRed)),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colorconst.cwhite,
                                        side: const BorderSide(
                                            color: Colorconst.cRed),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.video_call,
                                              color: Colorconst.cRed),
                                          SizedBox(width: 4.w),
                                          Text('English',
                                              style: TextStyle(
                                                  color: Colorconst.cRed)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                // Spacing before the next container
                Container(
                  height: 30.h,
                  width: double.infinity,
                  color: Colorconst.cSecondaryGrey,
                  child: Center(
                    child: Text(
                      'You can select one of the ways to close books.',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Text(
                    'Restart transaction numbers',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colorconst.cBlack),
                  ),
                ),
                SizedBox(height: 8.h), // Spacing before description text
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Text(
                    'Keep your data as it is. This option will just allow you to change the transaction prefixes and start with fresh transaction sequence numbers in new Financial Year. All your data will remain in your current company.',
                    style: TextStyle(fontSize: 12.sp, color: Colorconst.cBlack),
                  ),
                ),
                SizedBox(height: 12.h), // Spacing before button
                MaterialButton(
                  height: 40.h,
                  color: Colorconst.cBlue,
                  minWidth: double.infinity,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrefixScreen()));
                  },
                  child: Text(
                    'CHANGE PREFIXES',
                    style: TextStyle(color: Colorconst.cwhite, fontSize: 14.sp),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),

          SizedBox(height: 16.h), // Spacing before the next container
          Container(
            padding: EdgeInsets.all(10.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the container
              borderRadius: BorderRadius.zero,
              // Optional, to give rounded corners
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.grey.withOpacity(0.5), // Shadow color with opacity
                  spreadRadius: 5, // How far the shadow spreads
                  blurRadius: 7, // The blur radius
                  offset: Offset(0,
                      3), // Offset: X-axis and Y-axis (controls shadow position)
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Backup all data and start fresh',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colorconst.cBlack),
                ),
                SizedBox(height: 8.h), // Spacing before description text
                Text(
                  'All the transaction data up to the closing date will be backed up and removed from company to start all fresh. You can always access your data from the backup.',
                  style: TextStyle(fontSize: 12.sp, color: Colorconst.cBlack),
                ),
                SizedBox(height: 12.h), // Spacing before the date row
                Row(
                  children: [
                    // TextFormField to show the date
                    Expanded(
                      child: TextFormField(
                        controller: _dateController,
                        readOnly: true, // Make the text field non-editable
                        decoration: InputDecoration(
                          labelText: 'Closing Date',
                          labelStyle: TextStyle(
                              color: Colorconst
                                  .cBlue), // Set label text color to black
                          border: InputBorder.none, // Remove the border
                        ),
                        style: TextStyle(
                            color: Colors.black), // Set text color to black
                      ),
                    ),
                    // Spacing between the field and the icon
                    // Calendar icon
                    IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colorconst.cBlue,
                      ),
                      onPressed: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );

                        if (selectedDate != null) {
                          // Update the text field with the selected date
                          setState(() {
                            _dateController.text = formatDate(selectedDate);
                          });
                        }
                      },
                    ),
                    // Rectangle-shaped button with blue color
                    ElevatedButton(
                      onPressed: () {
                        // Handle 'Start Fresh' button click
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.zero, // Make the button rectangle
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12), // Padding for button size
                      ),
                      child: Text(
                        'Start Fresh',
                        style: TextStyle(color: Colors.white), // Text color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
