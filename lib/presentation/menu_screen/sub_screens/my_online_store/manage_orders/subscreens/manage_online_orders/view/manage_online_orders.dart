import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class ManageOnlineOrders extends StatelessWidget {
  const ManageOnlineOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image at the center
            Image.asset(
              'assets/images/images__3_-removebg-preview.png', // Replace with your image path
              width: 100.h, // Set the size of the image
              height: 100.h,
            ),

            SizedBox(height: 10.h), // Spacing between image and text

            // Text under the image
            Text(
              'No Online Orders',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colorconst.cBlack,
              ),
            ),
            Text(
              'Sheare your online store to get orders',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colorconst.cGrey,
              ),
            ),
            SizedBox(height: 10.h), // Spacing between text and button

            // Button under the text
            Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: ElevatedButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Stadium-shaped button
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform(
                      transform: Matrix4.diagonal3Values(-1, 1, 1),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.reply,
                        size: 23.sp,
                        color: Colorconst.cwhite,
                      ),
                    ),
                    Text(
                      'Add Order',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows for scrolling content
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;
        final screenWidth = MediaQuery.of(context).size.width;

        return Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            top: screenHeight * 0.02,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'Preview & Share',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Divider(),

                // Container with description
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  decoration: BoxDecoration(
                    color: Colorconst.cBluelight,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colorconst.cwhite,
                        radius: 10.r,
                      ),
                      // SizedBox(width: screenWidth * 0.02),
                      Text(
                        'Get your own website for online store now',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colorconst.cGrey,
                        ),
                      ),
                      //SizedBox(width: screenWidth * 0.02),
                      Text(
                        'Click Here',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colorconst.cBlue,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // Scrollable content with long text
                Container(
                  height:
                      screenHeight * 0.2, // Set height to make it scrollable
                  decoration: BoxDecoration(
                    color: Colorconst.cGrey2,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: Text(
                            'Your own website can help you reach a wider audience. '
                            'With the ability to showcase your products online, customers '
                            'can easily view and order them, leading to higher sales. '
                            'You can also add a blog to share updates, manage customer feedback, '
                            'and ensure a professional look for your business.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colorconst.cGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: Text(
                            'Having your store online means you are open 24/7. '
                            'Let your customers reach you anytime and from anywhere. '
                            'Build your brand by getting your own personalized website now.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colorconst.cGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // TextFormField for additional input
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText:
                        'Now Place Orders For Your home and get attractive discounts',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // Checkbox for "Don't show this again"
                Row(
                  children: [
                    Checkbox(
                      tristate: true, // Allow null value for the checkbox
                      value:
                          null, // This will work now since tristate is enabled
                      onChanged: (bool? value) {
                        // Your onChanged logic here
                      },
                    ),
                    Expanded(
                      child: Text(
                        "Don't show this pop-up again",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colorconst.cBlack,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.03),

                // Button at the bottom
                Container(
                  height: screenHeight * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colorconst.cRed,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Text(
                      'Save & Share',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
