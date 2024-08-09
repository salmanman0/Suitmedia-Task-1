import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class FirstScreenController extends GetxController {
  final TextEditingController palindromeText = TextEditingController();
  final TextEditingController nameText = TextEditingController();

  void isPalindrome(String text) {
    String perataan = text.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();
    String reverse = perataan.split('').reversed.join('');
    bool palindrome = perataan == reverse;
    if (palindrome) {
      if (text != "") {
        showDialogSuccess();
      } else {
        showDialogWarning();
      }
    } else {
      showDialogFailed();
    }
  }

  void checkEmptyColumn (String text){
    if(text == ""){
      showDialogWarning();
    }
    else{
      Get.offNamed(Routes.SECOND_SCREEN, arguments: {"name" : text});
    }
  }

  void showDialogSuccess() {
    Get.dialog(
      AlertDialog(
        title: const Text('Success!'),
        content: const Text('isPalindrome'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void showDialogFailed() {
    Get.dialog(
      AlertDialog(
        title: const Text('Failed!'),
        content: const Text('Not Palindrome'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void showDialogWarning() {
    Get.dialog(
      AlertDialog(
        title: const Text('Warning!'),
        content: const Text('Please fill all columns'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
