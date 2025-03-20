import 'package:get/get.dart';
import 'package:myapp/models/order_manage.dart';
import 'package:myapp/services/admin/order_service.dart';

class OrderListController extends GetxController {
  final Map<String, dynamic> params = Get.parameters;
  List<OrderManage> orders = <OrderManage>[].obs;
  late bool status;
  var isLoading = false.obs;

  void loadData(bool status) async {
    try {
      isLoading(true);
      var datas = await OrderService().fetchOrders(status);
      orders.assignAll(datas);
      isLoading(false);
    } catch (e) {
      isLoading(true);
    }
  }

  void deleteOrder(int id) async {
    try {
      isLoading(true);
      var data = await OrderService().deleteOrder(id);
      orders.removeWhere((item) => item.id == id);
      Get.snackbar("Thông báo", data);
      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
  }

  void approveOrder(int id) async {
    try {
      isLoading(true);
      var data = await OrderService().approveOrder(id);
      orders.removeWhere((item) => item.id == id);
      Get.snackbar("Thông báo", data);
      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    status = bool.parse(params['status']);
    loadData(status);
  }
}
