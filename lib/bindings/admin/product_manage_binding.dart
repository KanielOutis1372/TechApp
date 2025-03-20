import 'package:get/get.dart';
import 'package:myapp/controllers/admin/product_manage_controller.dart';

class ProductManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductManageController());
  }
}
