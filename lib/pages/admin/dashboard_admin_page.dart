// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/admin/dashboard_admin_controller.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/utils/helper.dart';
import 'package:myapp/utils/my_definition.dart';

class DashboardAdminPage extends GetView<DashboardAdminController> {
  const DashboardAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: const Text(
                    'Admin',
                    style: TextStyle(fontSize: 22),
                  ),
                ), // Tên người dùng
                accountEmail: null, // Email người dùng (nếu có)
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
                // otherAccountsPictures: <Widget>[],
                decoration:
                    const BoxDecoration(color: MyDefinition.PRIMARY_COLOR),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Dashboard'),
                onTap: () {
                  // Xử lý khi người dùng chọn trang chủ
                  Get.toNamed(AppRoutes.DASHBOARD_ADMIN);
                },
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
                height: 4,
              ),
              ListTile(
                leading: const Icon(Icons.production_quantity_limits),
                title: const Text('Quản lý đơn hàng'),
                onTap: () {
                  Get.toNamed(AppRoutes.ORDER_MANAGE);
                },
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
                height: 4,
              ),
              ListTile(
                leading: const Icon(Icons.production_quantity_limits),
                title: const Text('Quản lý sản phẩm'),
                onTap: () {
                  // Xử lý khi người dùng chọn quản lý sản phẩm
                  Get.toNamed(AppRoutes.PRODUCT_CATE);
                },
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
                height: 4,
              ),
              ListTile(
                leading: const Icon(Icons.category_rounded),
                title: const Text('Quản lý danh mục'),
                onTap: () {
                  // Xử lý khi người dùng chọn quản lý danh mục
                  Get.toNamed(AppRoutes.CATEGORY_MANAGE);
                },
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
                height: 4,
              ),
              ListTile(
                leading: const Icon(Icons.supervised_user_circle),
                title: const Text('Quản lý người dùng'),
                onTap: () {
                  // Xử lý khi người dùng chọn quản lý danh mục
                  Get.toNamed(AppRoutes.ACC_MANAGE);
                },
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
                height: 4,
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Đăng xuất'),
                onTap: () {
                  // Xử lý khi người dùng chọn đăng xuất
                  // controller.logout();
                  Get.defaultDialog(
                    title: 'Xác nhận',
                    content: const Text('Đăng xuất?'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          controller.logout();
                          Get.back();
                        },
                        child: const Text('Xác nhận'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Hủy'),
                      ),
                    ],
                  );
                },
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
                height: 4,
              ),
            ],
          ),
        ),
        body:
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       // Container đầu tiên
            //       Container(
            //         width: double.infinity,
            //         margin: const EdgeInsets.all(20),
            //         padding: const EdgeInsets.all(20),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: Colors.white,
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.grey.withOpacity(0.5),
            //               spreadRadius: 5,
            //               blurRadius: 7,
            //               offset: const Offset(0, 3), // Độ lệch shadow
            //             ),
            //           ],
            //         ),
            //         child: const Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: [
            //             IconWithCounter(
            //               icon: Icons.shopping_cart_rounded,
            //               title: 'Đơn đã duyệt',
            //               counter: '4',
            //               iconColor: Colors.green,
            //               // dashboardController.approvedOrders.value.toString(),
            //             ),
            //             IconWithCounter(
            //               icon: Icons.add_shopping_cart_rounded,
            //               title: 'Đơn chưa duyệt',
            //               counter: '5',
            //               iconColor: Colors.red,
            //               // dashboardController.unapprovedOrders.value.toString(),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Obx(
          () => controller.isLoading.value
              ? const Align(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 14.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DashboardCard(
                          title: 'Tổng số lượng đơn hàng',
                          value:
                              '${Helper().formatNumber(controller.totalOrders.value).toString()} (đơn)',
                          icon: Icons.shopping_cart,
                          color: Colors.blue,
                        ),
                        const SizedBox(height: 16),
                        DashboardCard(
                          title: 'Doanh số',
                          value:
                              '${Helper().formatNumber(controller.totalRevenue.value).toString()} (vnđ)',
                          icon: Icons.monetization_on,
                          color: Colors.green,
                        ),
                        const SizedBox(height: 16),
                        DashboardCard(
                          title: 'Tổng số lượng người dùng',
                          value: Helper()
                              .formatNumber(controller.totalUsers.value)
                              .toString(),
                          icon: Icons.people,
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 16),
                        DashboardCard(
                          title: 'Tổng số lượng mặt hàng hiện có',
                          value: Helper()
                              .formatNumber(controller.totalProducts.value)
                              .toString(),
                          icon: Icons.shopping_basket,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color,
              size: 36,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
