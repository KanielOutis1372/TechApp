import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/admin/order_manage_controller.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/utils/helper.dart';

import '../../utils/my_definition.dart';

class OrderManagePage extends GetView<OrderManageController> {
  const OrderManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () => Get.back(),
          ),
          title: const Text('Quản lý đơn hàng'),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Align(child: CircularProgressIndicator())
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Container đầu tiên
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // Độ lệch shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.ORDER_LIST,
                                  parameters: {'status': true.toString()}),
                              child: IconWithCounter(
                                icon: Icons.shopping_cart_rounded,
                                title: 'Đơn đã duyệt',
                                counter: Helper()
                                    .formatNumber(controller.approved.value)
                                    .toString(),
                                iconColor: Colors.green,
                                // dashboardController.approvedOrders.value.toString(),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.ORDER_LIST,
                                  parameters: {'status': false.toString()}),
                              child: IconWithCounter(
                                icon: Icons.add_shopping_cart_rounded,
                                title: 'Đơn chưa duyệt',
                                counter: Helper()
                                    .formatNumber(controller.notApproved.value)
                                    .toString(),
                                iconColor: Colors.red,
                                // dashboardController.unapprovedOrders.value.toString(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class IconWithCounter extends StatelessWidget {
  final IconData icon;
  final String title;
  final String counter;
  final Color iconColor;

  const IconWithCounter(
      {super.key,
      required this.icon,
      required this.title,
      required this.counter,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Icon(
              icon,
              size: 100,
              color: iconColor,
            ), // Icon giỏ hàng
            Positioned(
              // Vị trí số lượng ở góc trên phải của icon
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red, // Màu nền cho số lượng
                ),
                child: Text(
                  counter,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: MyDefinition.PRIMARY_FONT_SIZE),
        ),
      ],
    );
  }
}
