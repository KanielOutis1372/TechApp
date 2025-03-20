import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/services/client/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  var isPassVisible = false.obs;

  void togglePassVisible() => isPassVisible.value = !isPassVisible.value;

  void login() async {
    isLoading(true);
    dynamic result =
        await UserSerive().login(emailController.text, passwordController.text);
    if (result is User) {
      if (result.isAdmin) {
        Get.offNamed(AppRoutes.DASHBOARD_ADMIN);
        Get.snackbar('Thông báo', 'Đăng nhập với tư cách ADMIN');
      } else {
        final prefs = await SharedPreferences.getInstance();
        final userJson = jsonEncode(result.toJson());
        await prefs.setString('user', userJson);
        Get.snackbar('Thành công', 'Đăng nhập thành công');
        Get.offAllNamed(AppRoutes.DASHBOARD);
      }
      isLoading(false);
    } else if (result is String) {
      Get.snackbar('Thất bại', result);
      isLoading(false);
    } else {
      Get.snackbar('Thất bại', 'Server lỗi!!!');
      isLoading(false);
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
