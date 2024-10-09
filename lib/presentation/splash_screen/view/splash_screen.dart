import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/login__screen/sign_in_screen/sign_in_screen.dart';

import '../controller/controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
 final _controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colorconst.background1,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.53,
                width: size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    color: Colorconst.primaryC,
                    image: DecorationImage(
                        image: AssetImage('assets/images/splash_screen_img.jpeg'),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              top: size.height * 0.6,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "Discover your\nCompany's Status",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colorconst.text1,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Discover your\nCompany's Status",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colorconst.text2,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colorconst.background3.withOpacity(0.9),
                          border: Border.all(
                            color: Colors.white,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.08,
                                width: size.width / 2.2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colorconst.text1,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Obx(
                               () {
                                  return GestureDetector(
                                    onTap: () {
                                   _controller.fontsize.value=   _controller.first.value?35 : 20;

                                    _controller.first.value=! _controller.first.value;
                                      // setState(() {
                                      //   fontsize = first ? 35 : 20;
                                      //   color =
                                      //       first ? Colors.red : Colorconst.text1;
                                      //   first = !first;
                                      // });
                                      Future.delayed(
                                        Duration(milliseconds: 1000),
                                      );
                                      Get.to(
                                        () => SignInScreen(),
                                        transition: Transition.circularReveal,
                                        duration: Duration(seconds: 2),
                                      );
                                    },
                                    child: AnimatedDefaultTextStyle(
                                      duration: Duration(seconds: 1),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:  _controller.first.value?Colors.red : Colorconst.text1),
                                      child: const Text(
                                        'Sign In',
                                      ),
                                    ),
                                  );
                                }
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
