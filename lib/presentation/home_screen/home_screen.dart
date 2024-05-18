import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_swift/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:task_swift/routes/app_route_name.dart';

class HomeScreen extends GetWidget<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.logout();
                },
                child: const Text("Logout")),
            TextFormField()
          ],
        ),
      ),
    );
  }
}
