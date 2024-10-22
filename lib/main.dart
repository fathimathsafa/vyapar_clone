import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'presentation/splash_screen/main/view/splash_screen.dart';

import 'repository/app_data/user_data/shared_preferences.dart';

void main()async {
  runApp(const MyApp());
  await SharedPreLocalStorage.init();
}

class MyApp extends StatelessWidget {
 const  MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
       
     
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
