import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:suitmedia_app/app/color_app.dart';
import 'package:suitmedia_app/app/text_app.dart';

import '../controllers/first_screen_controller.dart';

class FirstScreenView extends GetView<FirstScreenController> {
  const FirstScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.r,
                backgroundColor: const Color.fromARGB(150, 210, 210, 210),
                child: const Icon(
                  Icons.person_add_alt_1,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: SizedBox(
                  height: 45.h,
                  child: TextField(
                    controller: controller.nameText,
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: text500(16, const Color.fromARGB(92, 104, 103, 119)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12.r)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: SizedBox(
                  height: 45.h,
                  child: TextField(
                    controller: controller.palindromeText,
                    decoration: InputDecoration(
                      hintText: "Palindrome",
                      hintStyle:
                          text500(16, const Color.fromARGB(92, 104, 103, 119)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12.r)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 45.h),
              Container(
                width:  MediaQuery.of(context).size.width,
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                margin: EdgeInsets.only(bottom: 15.h),
                child: ElevatedButton(
                  onPressed: ()=> controller.isPalindrome(controller.palindromeText.text),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(primary(oppacity: 255)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)))
                  ),
                  child: Text(
                    "CHECK",
                    style: text500(14, Colors.white),
                  ),
                ),
              ),
              Container(
                width:  MediaQuery.of(context).size.width,
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                margin: EdgeInsets.only(bottom: 15.h),
                child: ElevatedButton(
                  onPressed: ()=> controller.checkEmptyColumn(controller.nameText.text),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(primary(oppacity: 255)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)))
                  ),
                  child: Text(
                    "NEXT",
                    style: text500(14, Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
