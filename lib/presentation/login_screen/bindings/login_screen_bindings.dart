import 'package:get/get.dart';
import 'package:task_swift/presentation/login_screen/controller/login_screen_controller.dart';

class LoginScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
  }
}
