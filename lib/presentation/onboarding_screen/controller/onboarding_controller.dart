import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_swift/routes/app_route_name.dart';

class OnboardingController extends GetxController {
  RxInt selectedPage = 0.obs;
  late PageController pageController;

  void animatePageForward() {
    if (selectedPage.value == 2) {
      Get.offNamed(AppRouteName.loginScreen);
    } else {
      pageController.animateToPage(selectedPage.value + 1,
          duration: const Duration(milliseconds: 150), curve: Curves.linear);
    }
  }

  void animatePageBackWard() {
    pageController.animateToPage(selectedPage.value - 1,
        duration: const Duration(milliseconds: 150), curve: Curves.linear);
  }

  void skip() {
    Get.offNamed(AppRouteName.loginScreen);
  }

  @override
  void onInit() {
    super.onInit();
    pageController =
        PageController(initialPage: selectedPage.value, keepPage: true);
  }
}
