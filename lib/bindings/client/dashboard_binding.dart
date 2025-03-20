import 'package:get/get.dart';
import 'package:myapp/controllers/client/export_controllers.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    //Get.lazyPut(() => DetailController());
    Get.lazyPut(() => HistoryController());
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => FavorController());
    //Get.lazyPut(() => ListProductController());
    //Get.lazyPut(() => PaymentController());
    //Get.lazyPut(() => SearchController());
  }
}
