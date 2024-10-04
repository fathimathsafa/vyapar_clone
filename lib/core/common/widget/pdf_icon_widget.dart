import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PdfOptionsBottomSheet extends StatelessWidget {
  const PdfOptionsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header Row: "PDF Options" and Close Icon
        Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PDF Options',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colorconst.cBlack),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        Divider(),
        _pdfOptionItem(
          context,
          icon: Icons.document_scanner_outlined,
          text: 'Open PDF',
          onTap: () {},
        ),
        Divider(),
        _pdfOptionItem(
          context,
          icon: Icons.print_outlined,
          text: 'Print PDF',
          onTap: () {},
        ),
        Divider(),
        _pdfOptionItem(
          context,
          icon: Icons.forward,
          text: 'Share PDF',
          onTap: () {},
        ),
        Divider(),

        _pdfOptionItem(
          context,
          icon: Icons.file_download_outlined,
          text: 'Save PDF',
          onTap: () {},
        ),
      ],
    );
  }

  // Widget for each option (icon and text)
  Widget _pdfOptionItem(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon, size: 25.sp),
          onPressed: onTap,
        ),
        Text(
          text,
          style: TextStyle(color: Colorconst.cBlack, fontSize: 18.sp),
        ),
      ],
    );
  }

  // Show another bottom sheet when an option is selected
}
