import 'package:get/get.dart';
import 'package:myapp/services/admin/order_service.dart';

class OrderManageController extends GetxController {
  var approved = 0.obs;
  var notApproved = 0.obs;
  var isLoading = false.obs;

  void fetchData() async {
    try {
      isLoading(true);
      final data = await OrderService().getOrderCounter();
      approved.value = int.parse(data['total_approved_orders']);
      notApproved.value = int.parse(data['total_not_approved_orders']);
      isLoading(false);
    } catch (e) {
      isLoading(true);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
}
