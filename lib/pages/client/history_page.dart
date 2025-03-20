import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/helper.dart';

import '../../controllers/client/history_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/my_definition.dart';
import 'package:intl/intl.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Lịch sử đặt hàng',
            style: TextStyle(
              fontSize: MyDefinition.PRIMARY_FONT_SIZE + 2,
              color: MyDefinition.SECONDARY_COLOR_1,
            ),
          ),
        ),
        body: Obx(
          () => !controller.isLoginned.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.SIGN_IN_PAGE);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyDefinition.SECONDARY_COLOR_2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                color: MyDefinition.PRIMARY_COLOR)),
                      ),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MyDefinition.PRIMARY_FONT_SIZE - 1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.SIGN_UP_PAGE);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyDefinition.SECONDARY_COLOR_2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                color: MyDefinition.PRIMARY_COLOR)),
                      ),
                      child: const Text(
                        'Đăng ký',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MyDefinition.PRIMARY_FONT_SIZE - 1,
                        ),
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: controller.orders.length,
                  itemBuilder: (context, index) {
                    var order = controller.orders[index];
                    Color? backgroundColor =
                        order.status ? Colors.white : Colors.grey[300];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(12), // Border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.1), // Màu của box shadow
                            spreadRadius: 2, // Độ lan rộng của shadow
                            blurRadius: 7, // Độ mờ của shadow
                            offset:
                                const Offset(0, 3), // Độ tương phản của shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text('Đơn hàng #${order.id}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Ngày: ${DateFormat('dd/MM/yyyy').format(order.date)}'),
                            Text(
                                'Tổng: ${Helper().formatNumber(order.totalprice)} vnđ'),
                          ],
                        ),
                        tileColor: backgroundColor,
                        trailing: order.status
                            ? const Text('Đã xác nhận')
                            : const Text('Chưa xác nhận'),
                        onTap: () {},
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
