import 'package:get/get.dart';
import 'package:myapp/controllers/admin/acc_manage_controller.dart';

class AccManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccManageController());
  }
}
