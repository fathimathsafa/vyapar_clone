import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/images.dart';

import '../../../controller/controller.dart';


class BusinessCard1Screen extends StatelessWidget {
 
  final PageController _pageController = PageController();

  final List<String> images = [
    'quick_link_1.png', 
    'device_sync_screen.png',
    'quick_link_1.png', 
    'device_sync_screen.png',
    'quick_link_1.png', 
    'device_sync_screen.png',
    
  ];

final _controller = Get.find<BusinessCardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconst.cSecondaryGrey,
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                _controller.setImageTab1(index);
              },
              itemBuilder: (context, index) {
                return Imageconst().setImage(imageName: 
                  images[index],
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
          SizedBox(height: 30.h,),

         
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  child: Obx(
                   () {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Imageconst().setImage(
                          imageName: 
                          images[index],
                          width:_controller.selectedImageTab1.value ==index? 100.w:70.w,
                          hieght:_controller.selectedImageTab1.value ==index? 80.h:60.h,
                          fit: BoxFit.contain,
                        ),
                      );
                    }
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 100.h,),

          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(
              () {
                
                int index = _controller.selectedImageTab1.value;
                return SmoothPageIndicator(
                controller: _pageController,
                count: images.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colorconst.cRed, // Change to your preferred color
                  dotHeight: 5.h,
                  dotWidth: 6.w,
                ),
              );},
            ),
          ),
          SizedBox(height: 60.h,)
        ],
      ),
    );
  }
}