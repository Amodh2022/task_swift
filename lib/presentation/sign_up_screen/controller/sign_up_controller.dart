import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_swift/common_widgets/snack_bar.dart';
import 'package:task_swift/routes/app_route_name.dart';

class SignUpController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  //Firebase SignUp
  callFireSignUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passWordController.text,
      );
      if (kDebugMode) {
        print(credential);
      }
      TaskSwiftSnackBar.showSnackBarSuccess(
          Get.context!, "Welcome onBoard Created Success...", Colors.green);
      isLoading.value = false;
      Get.offNamed(AppRouteName.loginScreen);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'weak-password') {
        TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
      } else if (e.code == 'email-already-in-use') {
        TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
