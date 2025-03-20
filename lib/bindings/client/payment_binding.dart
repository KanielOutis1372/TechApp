import 'package:get/get.dart';
import 'package:myapp/controllers/client/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
