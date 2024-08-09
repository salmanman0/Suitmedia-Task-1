import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle text400(int fontsize, Color? color){
  return GoogleFonts.poppins(
    fontSize: fontsize.sp,
    fontWeight: FontWeight.w400,
    color: color ?? Colors.black,
  );
}
TextStyle text500(int fontsize, Color? color){
  return GoogleFonts.poppins(
    fontSize: fontsize.sp,
    fontWeight: FontWeight.w500,
    color: color ?? Colors.black,
  );
}
TextStyle text600(int fontsize, Color? color){
  return GoogleFonts.poppins(
    fontSize: fontsize.sp,
    fontWeight: FontWeight.w600,
    color: color ?? Colors.black,
  );
}