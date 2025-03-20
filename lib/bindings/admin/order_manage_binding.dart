import 'package:get/get.dart';
import 'package:myapp/controllers/admin/order_manage_controller.dart';

class OrderManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderManageController());
  }
}
