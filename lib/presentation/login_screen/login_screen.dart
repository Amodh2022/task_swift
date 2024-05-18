import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_swift/constants/color.dart';
import 'package:task_swift/presentation/login_screen/controller/login_screen_controller.dart';
import 'package:task_swift/routes/app_route_name.dart';
import '../../common_widgets/task_swift_button.dart';
import '../../common_widgets/task_swift_textfield.dart';

class LoginScreen extends GetWidget<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formKey,
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.pageIndicatorColorActive,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Log In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ).paddingOnly(top: 30, left: 24),
                  TaskSwiftTextField(
                      textEditingController: controller.emailController,
                      labelText: "Email",
                      hintText: "Enter Email",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter email";
                        }
                        return null;
                      }).paddingOnly(top: 30, left: 24, right: 24),
                  TaskSwiftTextField(
                      textEditingController: controller.passWordController,
                      labelText: "Password",
                      hintText: "Enter Password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      }).paddingOnly(top: 30, left: 24, right: 24),
                  GestureDetector(
                    onTap: () {
                      controller.isLoading.value = true;
                      if (controller.formKey.currentState!.validate()) {
                        Future.delayed(const Duration(seconds: 3), () {
                          controller.callFireSignIn();
                        });
                      }
                    },
                    child: Obx(() => TaskSwiftButton(
                          margin: const EdgeInsets.only(
                              left: 24, right: 24, top: 80),
                          controller.isLoading.value ? "Logging In" : "Login",
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRouteName.signUpScreen);
                    },
                    child: const Text(
                      "Don't have account?Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ).paddingOnly(top: 30, left: 24),
                  GestureDetector(
                    onTap: () {
                      controller.signInWithGoogle();
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 24, right: 24, top: 20),
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Sign in with Google",
                            style: TextStyle(
                              color: AppColors.pageIndicatorColorActive,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
