import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/helper.dart';

import '../../controllers/admin/order_list_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OrderListPage extends GetView<OrderListController> {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Get.back();
            },
          ),
          title: controller.status
              ? const Text('Đơn đã duyệt')
              : const Text('Đơn chưa duyệt'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Xử lý khi người dùng bấm nút tìm kiếm
              },
            ),
          ],
        ),
        body: Obx(
          () => Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Vị trí của bóng đổ
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Số lượng đơn hàng:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${controller.orders.length} (đơn)',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(
                  () => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const OrderListView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderListView extends GetView<OrderListController> {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.orders.isEmpty
          ? const Align(child: Text('Không có đơn nào'))
          : ListView.builder(
              itemCount: controller.orders.length,
              itemBuilder: (context, index) {
                final order = controller.orders[index];
                return Slidable(
                  key: ValueKey(index),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      // A SlidableAction can have an icon and/or a label.
                      SlidableAction(
                        onPressed: (_) => controller.deleteOrder(order.id),
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Xóa',
                      ),
                    ],
                  ),
                  endActionPane: controller.status
                      ? null
                      : ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (_) =>
                                  controller.approveOrder(order.id),
                              backgroundColor: const Color(0xFF0392CF),
                              foregroundColor: Colors.white,
                              icon: Icons.approval_rounded,
                              label: 'Duyệt',
                            ),
                          ],
                        ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: order.status
                          ? Colors.white
                          : Colors.grey[
                              200], // Màu nền xám nhạt cho đơn hàng chưa duyệt
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // Độ lệch shadow
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mã đơn: #${order.id}'),
                          Text('Họ tên: ${order.customerName}'),
                          Text('Email: ${order.email}'),
                          Text('Số điện thoại: ${order.phoneNumber}'),
                          Text('Địa chỉ: ${order.shippingAddress}'),
                          Text('Ngày đặt hàng: ${order.orderDate}'),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sản phẩm: ${order.products.join(', ')}'),
                          Text(
                              'Tổng tiền: ${Helper().formatNumber(order.totalPrice)} VNĐ'),
                          Text('Hình thức thanh toán: ${order.paymentMethod}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
