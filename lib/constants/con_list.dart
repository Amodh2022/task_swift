import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_swift/presentation/home_screen/home_screen.dart';

class ConstantList {
  static List<Widget> pageView = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/on-1.png",
          height: MediaQuery.of(Get.context!).size.height * 0.3,
          width: 200,
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          "Manage Your Task",
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          textAlign: TextAlign.center,
          "You can easily manage all of your \ndaily tasks in DoMe for free",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/on-2.png",
          height: MediaQuery.of(Get.context!).size.height * 0.3,
          width: 200,
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          "Create daily routine",
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          textAlign: TextAlign.center,
          "In Task-Swift you can create your \npersonalized routine to stay productive",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/on-3.png",
          height: MediaQuery.of(Get.context!).size.height * 0.3,
          width: 200,
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          "Organize Your Task",
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          textAlign: TextAlign.center,
          "You can organize your daily tasks \nby adding your tasks into separate categories",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    ),
  ];

  static List<Widget> icons = [
    const Icon(Icons.home_max),
    const Icon(Icons.calendar_month_rounded),
    const Icon(Icons.punch_clock_rounded),
    const Icon(Icons.supervised_user_circle_outlined),
  ];

  static List<Widget> navPage = [
    const HomeScreen(),
    const Scaffold(
      body: SafeArea(
        child: Text(
          "Calender",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    const Scaffold(
      body: SafeArea(
        child: Text(
          "IIII",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    const Scaffold(
      body: SafeArea(
        child: Text(
          "User",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ];
}
