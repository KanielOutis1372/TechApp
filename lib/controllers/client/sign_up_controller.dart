import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/services/client/user_service.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  var isLoading = false.obs;

  var isPassVisible = false.obs;

  void togglePassVisible() => isPassVisible.value = !isPassVisible.value;

  void registerUser() async {
    isLoading(true);
    const int id = 0;
    final String username = nameController.text;
    final String password = passwordController.text;
    final String email = emailController.text;
    final String phoneNumber = phoneController.text;
    const String avatarURL = '';
    final String deliveryAddress = addressController.text;

    var user = User(
        id: id,
        username: username,
        password: password,
        email: email,
        phoneNumber: phoneNumber,
        avatarURL: avatarURL,
        deliveryAddress: deliveryAddress,
        isAdmin: false);

    bool isSuccess = await UserSerive().register(user);

    if (isSuccess) {
      isLoading(false);
    }

    if (!isLoading.value) {
      Get.snackbar('Thành công', 'Đăng ký tài khoản thành công!');
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }
}
