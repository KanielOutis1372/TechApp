import 'package:get/get.dart';
import 'package:myapp/controllers/client/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
