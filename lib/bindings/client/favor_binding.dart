import 'package:get/get.dart';
import 'package:myapp/controllers/client/export_controllers.dart';

class FavorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FavorController(),
    );
  }
}
