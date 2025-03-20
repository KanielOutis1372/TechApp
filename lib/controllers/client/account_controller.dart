import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';

class AccountController extends GetxController {
  var isLogin = false.obs;
  User? currentUser;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController deliveryAddressController = TextEditingController();

  Future<void> checkLogedIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user')) {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user');
      if (userJson != null) {
        final userMap = jsonDecode(userJson);
        currentUser = User.fromJson(userMap);
      }
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    isLogin.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    checkLogedIn();
  }

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    deliveryAddressController.dispose();
  }
}
