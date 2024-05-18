import 'package:get/get.dart';

import '../controller/check_con_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectivityController>(() => ConnectivityController());
  }
}
