import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/common/widget/custom_text_field.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditStoreInfo extends StatelessWidget {
  const EditStoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Store Info',
          style:
              TextStyle(color: Colorconst.cBlack, fontSize: screenWidth * 0.05),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: screenWidth * 0.07),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Profile Picture Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CircleAvatar(
                            radius: screenWidth *
                                0.15, // Dynamic size based on screen width
                            backgroundImage: const NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw6GrlY9mXGbj7hIKKltKqte87hqTQUW0kLW_pwXCnKz52aieE'),
                          ),
                          Positioned(
                            bottom: -4,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colorconst.cBlue,
                                    size: screenWidth * 0.05,
                                  ),
                                  const Text(
                                    "Edit",
                                    style: TextStyle(
                                      color: Colorconst.cBlue,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // TextFormField Section
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.04),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * .5),
                        child: Text(
                          "About Business",
                          style: TextStyle(
                              color: Colorconst.cGrey,
                              fontSize: 20.r,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * .02,
                      ),
                      const Divider(),
                      SizedBox(
                        height: screenHeight * .02,
                      ),
                      CustomTextFormField(
                        hintText: "My Company",
                        labelText: "Business Name",
                      ),
                      SizedBox(
                        height: screenHeight * .03,
                      ),
                      CustomTextFormField(
                        hintText: "Business Description",
                        labelText: "Business Description",
                      ),
                      SizedBox(
                        height: screenHeight * .03,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * .4),
                        child: Text(
                          "160 Characters Remaining",
                          style: TextStyle(
                              color: Colorconst.cBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.r),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * .03,
                      ),
                      CustomTextFormField(
                        hintText: "Business Address",
                        labelText: "Business Address",
                      ),
                      SizedBox(
                        height: screenHeight * .03,
                      ),
                      CustomTextFormField(
                        hintText: "GSTIN Number (Optional)",
                        labelText: "GSTIN Number (Optional)",
                      ),
                      SizedBox(
                        height: screenHeight * .03,
                      ),
                      CustomTextFormField(
                        hintText: "Conatct Number",
                        labelText: "Conatct Number",
                      ),
                      SizedBox(
                        height: screenHeight * .03,
                      ),
                      CustomTextFormField(
                        hintText: "Email id",
                        labelText: "Email id",
                      ),
                      SizedBox(
                        height: screenHeight * .03,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    height: screenHeight *
                        0.15), // Spacing for the button at the bottom
              ],
            ),
          ),

          // Bottom Save Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              child: MaterialButton(
                onPressed: () {
                  // Perform Save Action
                },
                color: Colorconst.cRed,
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
