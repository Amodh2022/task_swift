import 'package:get/get.dart';
import 'package:task_swift/component/bottom_nav_bar/controller/bottom_nav_bar_controller.dart';

class TaskSwiftNavBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskSwiftNavBarController());
  }
}
