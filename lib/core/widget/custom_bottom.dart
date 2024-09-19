import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom(
      {super.key, required this.text, this.validator, required this.onPressed,  this.isLogin = false});
  final String text;
  final Function(String?)? validator;
  final VoidCallback onPressed;
  final bool isLogin ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 347.w,
      height: 60.h,
      child: MaterialButton(
        color: Color(0xff34A853),
        textColor: Colors.white,
        padding: EdgeInsets.only(right: 50.h, left: 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        onPressed: onPressed,
        child: isLogin? CircularProgressIndicator() : Text(
          text,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
