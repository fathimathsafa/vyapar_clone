import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar_clone/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/all_party_reports/view/all_party_reports.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/party_report_by_item_screen/view/party_report_by_items.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/party_reports/party_statement_screen/view/party_statement.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/report/sub_screen/sale_purchase_by_party_screen/view/sale_purchase_by_party_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/import_from_my_billbook_screen/sub_screen/bill_request_screen/view/bill_request_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/import_from_my_billbook_screen/view/import_from_my_bill_book.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/import_item_screen/sub_screens/item_library_screen/view/item_library_screen.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/import_item_screen/view/import_item_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: BottomNavigationScreen(),
        );
      },
    );
  }
}
