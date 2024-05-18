import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_swift/component/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';
import '../../common_widgets/animated_top.dart';
import '../../constants/con_list.dart';

class TaskSwiftNav extends GetWidget<TaskSwiftNavBarController> {
  const TaskSwiftNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() => ConstantList.navPage[controller.selectedIndex.value]),
        Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(controller.kAllPadding),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  ConstantList.icons.length,
                  (index) => GestureDetector(
                    onTap: () {
                      controller.selectedIndex.value = index;
                    },
                    child: Obx(() => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedBar(
                              isActive: controller.selectedIndex.value == index,
                            ),
                            SizedBox(
                              height: 36,
                              width: 36,
                              child: ConstantList.icons[index],
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
