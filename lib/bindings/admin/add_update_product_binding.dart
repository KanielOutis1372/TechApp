import 'package:get/get.dart';
import 'package:myapp/controllers/admin/add_update_product_controller.dart';

class AddOrUpdateProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddOrUpdateProductController());
  }
}
