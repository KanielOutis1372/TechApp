import 'package:get/get.dart';

import '../../controllers/client/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MySearchController());
  }
}
