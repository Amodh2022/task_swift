import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_swift/common_widgets/snack_bar.dart';
import 'package:task_swift/routes/app_route_name.dart';

class LoginScreenController extends GetxController {
  late final TextEditingController emailController, passWordController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  List<String> scopes = <String>[
    'email',
  ];
  late GoogleSignIn googleSignIn;

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      TaskSwiftSnackBar.showSnackBarSuccess(
          Get.context!, "Successfully Signed In", Colors.green);
      Get.offNamed(AppRouteName.navBar);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
        case "user-disabled":
          TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
        case "user-not-found":
          TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
        case "invalid-credential":
          TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
        default:
          TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
      }
    }
  }

  Future<dynamic> callFireSignIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passWordController.text,
      );
      isLoading.value = false;

      TaskSwiftSnackBar.showSnackBarSuccess(
          Get.context!, "Successfully Signed In", Colors.green);
      Get.offNamed(AppRouteName.navBar);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;

      switch (e.code) {
        case "invalid-email":
          TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
        case "user-disabled":
          TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
        case "user-not-found":
          TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
        case "invalid-credential":
          TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
        default:
          TaskSwiftSnackBar.showSnackBarError(Get.context!, e.code, Colors.red);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passWordController = TextEditingController();
    googleSignIn = GoogleSignIn(
      scopes: scopes,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passWordController.dispose();
    super.onClose();
  }
}
