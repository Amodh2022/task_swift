import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_swift/constants/color.dart';
import 'package:task_swift/presentation/sign_up_screen/controller/sign_up_controller.dart';
import '../../common_widgets/task_swift_button.dart';
import '../../common_widgets/task_swift_textfield.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

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
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ).paddingOnly(top: 30, left: 10),
                  TaskSwiftTextField(
                      textEditingController: controller.emailController,
                      labelText: "Email",
                      hintText: "Enter Email",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter email";
                        }
                        return null;
                      }).paddingOnly(top: 30, left: 10, right: 10),
                  TaskSwiftTextField(
                      textEditingController: controller.passWordController,
                      labelText: "Password",
                      hintText: "Enter Password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      }).paddingOnly(top: 30, left: 10, right: 10),
                  TaskSwiftTextField(
                      textEditingController: controller.confirmPassword,
                      labelText: "Confirm Password",
                      hintText: "Enter Password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        } else if (value !=
                            controller.passWordController.text) {
                          return "Password Doesn't Match";
                        }
                        return null;
                      }).paddingOnly(top: 30, left: 10, right: 10),
                  GestureDetector(
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.isLoading.value = true;
                        Future.delayed(const Duration(seconds: 3), () {
                          controller.callFireSignUp();
                        });
                      }
                    },
                    child: Obx(() => TaskSwiftButton(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 80),
                          controller.isLoading.value
                              ? "Please wait"
                              : "Sign Up",
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
