import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:suitmedia_app/app/color_app.dart';
import 'package:suitmedia_app/app/text_app.dart';

import '../../../routes/app_pages.dart';
import '../controllers/second_screen_controller.dart';

class SecondScreenView extends GetView<SecondScreenController> {
  const SecondScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String nama = Get.arguments['name'];
    String namaSelectUser = Get.arguments['selectUser'] ?? "Select User Name";

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen', style: text600(18, Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios_rounded, color: accent(oppacity: 255)),
          onPressed: () => Get.offNamed(Routes.FIRST_SCREEN),
        ),
        shadowColor: Colors.grey,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Welcome",
                    style: text400(12, Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    nama,
                    style: text600(18, Colors.black),
                  ),
                )
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  namaSelectUser,
                  style: text600(24, Colors.black),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 33.h),
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.THIRD_SCREEN, arguments: {"name": nama, "selectUser" : namaSelectUser}),
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(primary(oppacity: 255)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r)))),
                child: Text(
                  "Choose a User",
                  style: text500(14, Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
