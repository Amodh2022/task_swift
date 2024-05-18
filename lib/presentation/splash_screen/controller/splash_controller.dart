import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_swift/routes/app_route_name.dart';

class SplashScreenController extends GetxController {
  late Timer _timer;

  void checkIsLogged() {
    if (FirebaseAuth.instance.currentUser != null) {
      Get.toNamed(AppRouteName.navBar);
    } else {
      Get.toNamed(AppRouteName.loginScreen);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _timer = Timer(const Duration(seconds: 3), () {
      checkIsLogged();
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
