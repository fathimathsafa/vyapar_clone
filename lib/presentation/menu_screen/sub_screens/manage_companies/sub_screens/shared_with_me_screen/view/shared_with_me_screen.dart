import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';

class SharedWithMeScreen extends StatelessWidget {
  const SharedWithMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cBluelight,
      body: Padding(
        padding: EdgeInsets.all(8.w), // Padding around the container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h, // Height for the container
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(20.r)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Image.network(
                        'https://ecommercephotographyindia.com/info/wp-content/uploads/2021/09/Cover-Product-demo-video-guide.jpg', // Replace with your video thumbnail URL
                        width: 80.w, // Width for the image
                        height: 80.h, // Height for the image
                        fit: BoxFit.cover, // Cover the container
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w), // Space between image and text
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h), // Padding for text
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sync Your data across device in\nvyapar', // Title of the video
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colorconst.cBlack),
                          ),
                          SizedBox(
                              height: 4.h), // Space between title and subtitle
                          Row(
                            children: [
                              Text(
                                'Watch video', // Subtitle of the video
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colorconst.cRed),
                              ),
                              const Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Colorconst.cRed,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h), // Space below the container
            // You can add more widgets here as needed
          ],
        ),
      ),
    );
  }
}
