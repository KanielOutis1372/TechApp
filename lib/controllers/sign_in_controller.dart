import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isPassVisible = false.obs;

  void togglePassVisible() => isPassVisible.value = !isPassVisible.value;
}
