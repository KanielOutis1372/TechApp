import 'package:get/get.dart';
import 'package:myapp/controllers/admin/product_cate_controller.dart';

class ProductCateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductCateController());
  }
}
