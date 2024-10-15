

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/common/loading_var.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/snackbar/my_snackbar.dart';

import 'package:vyapar_clone/presentation/login__screen/controller/controller.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _controller = Get.put(SignInController());

  final TextEditingController phoneNoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colorconst.background2,
              Colorconst.background2,
              Colorconst.background4
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: size.height * 0.03),
              FadeInUp(
                from: 200,
                child: Text(
                  'Hello Again',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 37,
                    color: Colorconst.text1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              FadeInUp(
                from: 200,
                child: Text(
                  "Welcome back you've\nbeen missed",
                  style: TextStyle(
                    fontSize: 27,
                    color: Colorconst.text2,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              // Input field for phone number
              MyTextField(
                
                'Enter Your Mobile Number', Colors.white),
              SizedBox(height: size.height * 0.04),
              FadeInUp(
                from: 200,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Recovery Password      ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colorconst.text2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    // Sign-in button with login functionality
                    Obx(
                       () {
                        return isLoading.value == true?const CircularProgressIndicator(): GestureDetector(
                          onTap: ()  {
                            String phoneNo = phoneNoController.text.trim();
                            if(phoneNo.length.toInt()>=10){
                           _controller.login(number: phoneNo);

                            }else{
                              SnackBars.showErrorSnackBar(text: "Invalid Phone Number.");
                            }
                          },
                          child: FadeInUp(
                            from: 200,
                            child: Container(
                              width: size.width,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colorconst.buttonC,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                    SizedBox(height: size.height * 0.06),
                    // Other UI elements...
                    FadeInUp(
                      from: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 2,
                            width: size.width * 0.13,
                            color: Colors.black12,
                          ),
                          Text(
                            '  Or continue with  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colorconst.text2,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            height: 2,
                            width: size.width * 0.13,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SocialIcon('assets/images/google.png'),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SocialIcon('assets/images/apple.png'),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SocialIcon('assets/images/Facebook_logo.png'),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.07),
                    Text.rich(
                      TextSpan(
                        text: 'Not a member? ',
                        style: TextStyle(
                          color: Colorconst.text2,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                            text: 'Register now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Social icon method
  FadeInUp SocialIcon(image) {
    return FadeInUp(
      from: 400,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Image.asset(image, height: 25),
      ),
    );
  }

  // Text field with controller for input
  Widget MyTextField(String hint, Color color) {
    return FadeInUp(
      from: 500,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Obx(() {
          return AnimatedPhysicalModel(
            shape: BoxShape.rectangle,
            elevation: _controller.isFlat.value ? 0 : 5,
            color: Colorconst.background2,
            shadowColor: Colors.black,
            duration: Duration(microseconds: 300),
            child: TextField(
              style: TextStyle(fontSize: 18.sp,color: Colors.black87),
              controller:
                  phoneNoController, // Using the phone number controller
              obscureText:
                  hint == 'Enter Password', // Set obscureText for password
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: hint,
                hintStyle: TextStyle(color: Colors.black45, fontSize: 19),
                suffixIcon: Icon(Icons.visibility_off_outlined, color: color),
              ),
            ),
          );
        }),
      ),
    );
  }
}
