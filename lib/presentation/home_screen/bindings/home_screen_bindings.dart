import 'package:get/get.dart';
import 'package:task_swift/presentation/home_screen/controller/home_screen_controller.dart';

class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
  }
}
