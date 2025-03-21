import 'package:get/get.dart';
import 'package:myapp/controllers/client/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
