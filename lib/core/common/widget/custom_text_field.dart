import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.isEditable,
    this.hintText,
    this.isFiled,
    this.labelText,
    this.keyboardType,
    this.filledColor,
    this.suffixIconWidget,
    this.hintSytle,
    this.labelStyle,
    this.height, // Height for customization
    this.width, // Width for customization
  });
  final String? hintText;
  final String? labelText;
  final bool? isFiled;
  final bool? isEditable;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;
  final Widget? suffixIconWidget;
  final Color? filledColor;
   final TextStyle? hintSytle;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h, // Use ScreenUtil to make height responsive
      width: width ?? double.infinity, // Full width by default
      child: TextFormField(
        
        keyboardType: keyboardType,
        style: interFontBlack(context,
            color: Colorconst.cBlack,
            fontsize: 17.sp), // Use .sp for scalable text
        decoration: InputDecoration(

          suffixIcon: suffixIconWidget,
          enabled: isEditable??true,
          fillColor: filledColor,
          filled: isFiled,
          hintText: hintText ?? "Customer Name *",
          labelText: labelText ?? "Customer Name *",
          hintStyle: hintSytle,
          labelStyle: labelStyle?? interFontGrey(context,
              fontsize: 17.sp), // Scalable text for label
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2.w, color: Colorconst.cGrey), // Scalable border width
              borderRadius:
                  BorderRadius.circular(5.r)), // Scalable border radius
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.w, color: Colors.blue),
              borderRadius: BorderRadius.circular(5.r)),
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.h, // Scalable vertical padding
            horizontal: 15.w, // Scalable horizontal padding
          ),
        ),
      ),
    );
  }
}
