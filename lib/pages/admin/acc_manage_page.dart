import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/admin/acc_manage_controller.dart';

class AccManagePage extends GetView<AccManageController> {
  const AccManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          title: const Text('Quản lý người dùng'),
          actions: const [
            // Icon(Icons.search),
            // SizedBox(
            //   width: 14,
            // ),
            // Icon(Icons.add),
            // SizedBox(
            //   width: 16,
            // ),
          ],
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Align(child: LinearProgressIndicator())
              : const UserListView(),
        ),
      ),
    );
  }
}

class UserListView extends GetView<AccManageController> {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.accounts.isEmpty
          ? const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text('Không có dữ liệu'),
              ),
            )
          : ListView.builder(
              itemCount: controller.accounts.length,
              itemBuilder: (context, index) {
                final account = controller.accounts[index];
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  title: Text(account.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(account.email),
                      Text('Order: ${account.orderCount}'),
                    ],
                  ),
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // IconButton(
                      //   icon: const Icon(Icons.edit),
                      //   onPressed: () {
                      //     //_showEditUserDialog(context, user);
                      //   },
                      // ),
                      // IconButton(
                      //   icon: const Icon(Icons.delete),
                      //   onPressed: () {
                      //     //_showDeleteConfirmationDialog(context, user);
                      //   },
                      // ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  // void _showEditUserDialog(BuildContext context, User user) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Cập nhật tài khoản'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //               decoration: const InputDecoration(labelText: 'Username'),
  //               controller: TextEditingController(text: user.username),
  //             ),
  //             TextField(
  //               decoration: const InputDecoration(labelText: 'Password'),
  //               controller: TextEditingController(text: user.password),
  //             ),
  //             TextField(
  //               decoration: const InputDecoration(labelText: 'Email'),
  //               controller: TextEditingController(text: user.email),
  //             ),
  //             TextField(
  //               decoration: const InputDecoration(labelText: 'Phone'),
  //               controller: TextEditingController(text: user.phone),
  //             ),
  //             TextField(
  //               decoration:
  //                   const InputDecoration(labelText: 'Delivery Address'),
  //               controller: TextEditingController(text: user.deliveryAddress),
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Hủy'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               // Xử lý khi người dùng bấm nút lưu
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Lưu'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void _showDeleteConfirmationDialog(BuildContext context, User user) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Xác nhận xóa tài khoản'),
  //         content: const Text('Bạn có chắc chắn muốn xóa tài khoản này?'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Hủy'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               // Xử lý khi người dùng xác nhận xóa
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Xóa'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
