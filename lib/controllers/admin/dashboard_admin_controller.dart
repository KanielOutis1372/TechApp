import 'package:get/get.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/admin/dashboard_service.dart';

class DashboardAdminController extends GetxController {
  var totalOrders = 0.obs;
  var totalRevenue = 0.obs;
  var totalUsers = 0.obs;
  var totalProducts = 0.obs;
  var isLoading = false.obs;
  var isLogin = false.obs;

  Future<void> fetchData() async {
    try {
      isLoading(true);
      final data = await DashboardService().getDashboardData();
      totalOrders.value = int.parse(data['total_orders']);
      totalRevenue.value = int.parse(data['total_revenue']);
      totalUsers.value = int.parse(data['total_users']);
      totalProducts.value = int.parse(data['total_products']);
      isLoading(false);
    } catch (e) {
      isLoading(true);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    isLogin.value = false;
    Get.offAllNamed(AppRoutes.DASHBOARD);
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
}
