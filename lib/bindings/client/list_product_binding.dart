import 'package:get/get.dart';

import '../../controllers/client/list_product_controller.dart';

class ListProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListProductController());
  }
}
