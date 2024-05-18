import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:task_swift/constants/color.dart';
import 'package:task_swift/presentation/onboarding_screen/controller/onboarding_controller.dart';
import '../../constants/con_list.dart';

class OnBoardingScreen extends GetWidget<OnboardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            controller.skip();
          },
          child: Text(
            "Skip".toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ).paddingOnly(left: 10),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView(
                onPageChanged: (value) {
                  controller.selectedPage.value = value;
                },
                controller: controller.pageController,
                scrollDirection: Axis.horizontal,
                children: ConstantList.pageView,
              ),
            ),
            Obx(
              () => PageViewDotIndicator(
                borderRadius: BorderRadius.circular(15),
                size: const Size(30, 4),
                boxShape: BoxShape.rectangle,
                currentItem: controller.selectedPage.value,
                count: ConstantList.pageView.length,
                unselectedColor: AppColors.pageIndicatorColorDisable,
                selectedColor: AppColors.pageIndicatorColorActive,
              ),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    controller.animatePageBackWard();
                  },
                  child: Text(
                    "Back".toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ).paddingOnly(bottom: 10),
                ),
                InkWell(
                    onTap: () {
                      controller.animatePageForward();
                    },
                    child: Obx(() => Container(
                          height: 50,
                          width: controller.selectedPage.value == 2 ? 140 : 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade600,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            controller.selectedPage.value == 2
                                ? "Get Started".toUpperCase()
                                : "Next".toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        )))
              ],
            ).paddingOnly(left: 10, right: 10))
          ],
        ),
      ),
    );
  }
}
