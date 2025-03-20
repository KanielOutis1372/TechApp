import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/client/export_controllers.dart';
import 'package:myapp/routes/app_routes.dart';

import '../../utils/my_definition.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Thông tin tài khoản',
            style: TextStyle(
              fontSize: MyDefinition.PRIMARY_FONT_SIZE + 2,
              color: MyDefinition.SECONDARY_COLOR_1,
            ),
          ),
          actions: [
            Obx(() => controller.isLogin.value
                ? IconButton(
                    onPressed: () {
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
                    icon: const Icon(Icons.logout))
                : const SizedBox()),
          ],
        ),
        body: Obx(
          () => !controller.isLogin.value
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
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                        height: 1,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/images/avatar.jpg'), // Đặt ảnh đại diện của người dùng
                      ),
                      const SizedBox(height: 20),
                      Text(
                        controller.currentUser!.username,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: MyDefinition.SECONDARY_COLOR_2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.currentUser!.email,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: const Icon(
                            Icons.person,
                            color: MyDefinition.SECONDARY_COLOR_2,
                          ),
                          title: const Text('Tài khoản'),
                          subtitle: Text(controller.currentUser!.username),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: const Icon(
                            Icons.password_rounded,
                            color: MyDefinition.SECONDARY_COLOR_2,
                          ),
                          title: const Text('Mật khẩu'),
                          subtitle: Text(controller.currentUser!.password),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: const Icon(
                            Icons.phone_enabled_rounded,
                            color: MyDefinition.SECONDARY_COLOR_2,
                          ),
                          title: const Text('Số điện thoại'),
                          subtitle: Text(controller.currentUser!.phoneNumber),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: const Icon(
                            Icons.email_rounded,
                            color: MyDefinition.SECONDARY_COLOR_2,
                          ),
                          title: const Text('Email'),
                          subtitle: Text(controller.currentUser!.email),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: const Icon(
                            Icons.pin_drop_rounded,
                            color: MyDefinition.SECONDARY_COLOR_2,
                          ),
                          title: const Text('Địa chỉ nhận hàng'),
                          subtitle:
                              Text(controller.currentUser!.deliveryAddress),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return UpdateAccountDialog(
                                usernameController: TextEditingController(
                                    text: controller.currentUser!.username),
                                emailController: TextEditingController(
                                    text: controller.currentUser!.email),
                                passwordController: TextEditingController(
                                    text: controller.currentUser!.password),
                                phoneNumberController: TextEditingController(
                                    text: controller.currentUser!.phoneNumber),
                                deliveryAddressController:
                                    TextEditingController(
                                        text: controller
                                            .currentUser!.deliveryAddress),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyDefinition.SECONDARY_COLOR_2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                  color: MyDefinition.PRIMARY_COLOR)),
                        ),
                        child: const Text(
                          'Cập nhật thông tin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MyDefinition.PRIMARY_FONT_SIZE - 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class UpdateAccountDialog extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneNumberController;
  final TextEditingController deliveryAddressController;

  const UpdateAccountDialog({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneNumberController,
    required this.deliveryAddressController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Cập nhật thông tin tài khoản'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Tài khoản'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Mật khẩu'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Số điện thoại'),
            ),
            TextField(
              controller: deliveryAddressController,
              decoration: const InputDecoration(labelText: 'Địa chỉ nhận hàng'),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // // Lưu thông tin cập nhật
            // // Gọi phương thức cập nhật thông tin trong controller của bạn
            // Get.find<AccountController>().updateAccount(
            //   username: usernameController.text,
            //   email: emailController.text,
            //   phoneNumber: phoneNumberController.text,
            //   deliveryAddress: deliveryAddressController.text,
            // );
            Get.back();
          },
          child: const Text('Cập nhật'),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Hủy'),
        ),
      ],
    );
  }
}
