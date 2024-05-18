import 'package:get/get.dart';
import 'package:task_swift/presentation/splash_screen/controller/splash_controller.dart';

class SplashScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
  }
}
