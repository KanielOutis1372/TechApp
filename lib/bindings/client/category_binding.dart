import 'package:get/get.dart';
import 'package:myapp/controllers/client/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
  }
}
