import 'package:get/get.dart';
import 'package:myapp/controllers/client/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
