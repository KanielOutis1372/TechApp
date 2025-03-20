import 'package:get/get.dart';
import 'package:myapp/controllers/admin/category_manage_controller.dart';

class CategoryManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryManageController());
  }
}
