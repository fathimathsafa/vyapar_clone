import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/core/constatnts/text_style.dart';

class ManageItemCustomTextFormField extends StatelessWidget {
  ManageItemCustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.isEditable,
    this.suffixIconWidget,
    this.onChanged,
    this.fillColor,
    this.isFiled,
    this.hintSytle,
    this.autoFocus,
    this.focusedBorderColor,
    this.labelStyle,
  });
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool? isEditable;
  final bool? isFiled;
  final Widget? suffixIconWidget;
  final Color? fillColor;
  final Color? focusedBorderColor;
  final TextStyle? hintSytle;
  final TextStyle? labelStyle;
  final bool? autoFocus;

  final Function(String?)?onChanged;
  // final Function(String?)?onFieldSubmitted;
  // final Function(PointerDownEvent)?onTapOutside;
  //final TextEditingController? controller;
  // final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus:autoFocus??false ,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: interFontBlack(context, fontsize: 14.sp,color: Colors.black),
      decoration: InputDecoration(
        
        filled: isFiled?? false,
        fillColor: fillColor?? Colors.transparent,
        hintStyle: hintSytle,
        
        suffixIcon: suffixIconWidget,
        enabled: isEditable?? true,
        hintText: hintText ?? "Customer Name *",
        labelText: labelText ?? "Customer Name *",
        labelStyle:labelStyle?? interFontGrey(context, fontsize: 14.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 10.w),
        disabledBorder: OutlineInputBorder(
          
          
            borderSide: BorderSide(width: 1.w, color: Colorconst.cGrey),
            borderRadius: BorderRadius.circular(5)),
        border: OutlineInputBorder(
          
            borderSide: BorderSide(width: 1.w, color: Colorconst.cGrey),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.w, color:focusedBorderColor?? Colors.blue),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}