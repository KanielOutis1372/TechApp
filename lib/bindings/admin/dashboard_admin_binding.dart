import 'package:get/get.dart';
import 'package:myapp/controllers/admin/dashboard_admin_controller.dart';

class DashboardAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardAdminController());
  }
}
