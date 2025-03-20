import 'package:get/get.dart';
import 'package:myapp/controllers/admin/order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderListController());
  }
}
