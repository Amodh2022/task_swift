import 'package:get/get.dart';
import 'package:task_swift/presentation/onboarding_screen/controller/onboarding_controller.dart';

class OnboardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}
