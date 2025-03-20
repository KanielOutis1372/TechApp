import 'package:get/get.dart';
import 'package:myapp/controllers/client/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
  }
}
