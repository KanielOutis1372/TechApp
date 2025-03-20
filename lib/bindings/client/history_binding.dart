import 'package:get/get.dart';
import 'package:myapp/controllers/client/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}
