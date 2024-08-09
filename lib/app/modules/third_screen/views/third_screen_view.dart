import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../color_app.dart';
import '../../../routes/app_pages.dart';
import '../../../text_app.dart';
import '../controllers/third_screen_controller.dart';

class ThirdScreenView extends GetView<ThirdScreenController> {
  const ThirdScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nama = Get.arguments['name'];
    String namaSelectUser = Get.arguments['selectUser'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen', style: text600(18, Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back_ios_rounded, color: accent(oppacity: 255)),
          onPressed: () =>
              Get.offNamed(Routes.SECOND_SCREEN, arguments: {"name": nama, "selectUser":namaSelectUser}),
        ),
        shadowColor: Colors.grey,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() {
          if (controller.isLoading.value && controller.users.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.users.isEmpty) {
            return const Center(child: Text('No users found'));
          } else {
            return RefreshIndicator(
              onRefresh: () => controller.fetchUsers(isRefresh: true),
              child: ListView.builder(
                itemCount: controller.users.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.users.length) {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox.shrink();
                    }
                  } else {
                    final user = controller.users[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(backgroundImage: NetworkImage(user['avatar']), radius: 30.r,),
                          title: Text('${user['first_name']} ${user['last_name']}',style: text500(16, Colors.black)),
                          subtitle: Text(user['email'],style: text500(10, Colors.grey)),
                          onTap: () {
                            Get.offNamed(Routes.SECOND_SCREEN, arguments: {"name": nama,"selectUser":'${user['first_name']} ${user['last_name']}'});
                          },
                        ),
                        Divider(color: Colors.grey[200],thickness: 1), // Menambahkan garis bawah abu-abu
                      ],
                    );
                  }
                },
                controller: ScrollController()
                  ..addListener(() {
                    if (controller.isLoading.value == false) {
                      controller.loadMore();
                    }
                  }),
              ),
            );
          }
        }),
      ),
    );
  }
}
