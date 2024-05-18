import 'package:get/get.dart';
import 'package:task_swift/presentation/sign_up_screen/controller/sign_up_controller.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
