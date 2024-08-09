import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThirdScreenController extends GetxController {
  var users = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isLoading.value) return;
    isLoading.value = true;
    try {
      if (isRefresh) {
        currentPage.value = 1;
        users.clear();
      }
      
      final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=${currentPage.value}&per_page=10'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        totalPages.value = data['total_pages'];

        for (var user in data['data']) {
          users.add(user);
        }
      } else {
        Get.snackbar('Error', 'Failed to load data');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void loadMore() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      fetchUsers();
    }
  }
}
