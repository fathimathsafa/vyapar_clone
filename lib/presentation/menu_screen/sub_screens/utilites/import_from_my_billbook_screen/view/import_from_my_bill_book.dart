import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/utilites/import_from_my_billbook_screen/sub_screen/bill_request_screen/view/bill_request_screen.dart';

class ImportFromBillBookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Import from My Bill Book",
          style: const TextStyle(color: Colorconst.cBlack),
        ),
      ),
      body: Center(
        child: Text(
          'Content goes here',
          style: TextStyle(
              fontSize: 24.sp,
              color: Colorconst.cBlack), // Use ScreenUtil for responsive text
        ),
      ),
      floatingActionButton: Container(
        width: 200.w, // Responsive width
        height: 50.h, // Responsive height
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RequestBillBookScreen()));
          },
          backgroundColor: Colors.red,
          shape: StadiumBorder(),
          child: Text(
            'Submit Request',
            style: TextStyle(
                color: Colors.white, fontSize: 18.sp), // Responsive font size
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
