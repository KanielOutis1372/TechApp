import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/sign_in_controller.dart';
import '../utils/my_definition.dart';

class SignInPage extends GetView<SignInController> {
  SignInPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 27,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Đăng nhập để bắt đầu!',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 47,
                    ),
                    _buildComponent(),
                    const SizedBox(
                      height: 17,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () =>
                            Get.snackbar('Get password again', 'Get pass'),
                        child: const Text(
                          'Quên mật khẩu?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    _buildComponent2(),
                    const SizedBox(
                      height: 80,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            MyDefinition.PRIMARY_COLOR),
                        minimumSize: MaterialStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                            color: MyDefinition.TEXT_BUTTON_COLOR,
                            fontSize: MyDefinition.PRIMARY_FONT_SIZE),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () =>
                            Get.snackbar('Tạo tài khoản', 'Tạo tài khoản!'),
                        child: const Text(
                          'Tạo tài khoản',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComponent() {
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            style: TextStyle(
              fontSize: 14,
              color: MyDefinition.SECONDARY_COLOR_1,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          TextFormField(
            controller: controller.emailController,
            decoration: InputDecoration(
              prefixIconColor: MyDefinition.SECONDARY_COLOR_2,
              hintText: 'Nhập Email...',
              hintStyle: const TextStyle(
                  color: MyDefinition.SECONDARY_COLOR_2,
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: const Icon(Icons.email_outlined),
              contentPadding: const EdgeInsets.only(
                top: 16,
                right: 38,
                bottom: 16,
              ),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Vui lòng nhập họ tên!';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildComponent2() {
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mật khẩu',
            style: TextStyle(
              fontSize: 14,
              color: MyDefinition.SECONDARY_COLOR_1,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Obx(
            () => TextFormField(
              controller: controller.passwordController,
              decoration: InputDecoration(
                prefixIconColor: MyDefinition.SECONDARY_COLOR_2,
                hintText: 'Nhập mật khẩu...',
                hintStyle: const TextStyle(
                    color: MyDefinition.SECONDARY_COLOR_2,
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
                fillColor: Colors.grey[100],
                filled: true,
                prefixIcon: const Icon(Icons.password_sharp),
                contentPadding: const EdgeInsets.only(
                  top: 16,
                  right: 38,
                  bottom: 16,
                ),
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                suffixIcon: InkWell(
                  onTap: () {
                    controller.togglePassVisible();
                  },
                  child: Icon(
                    controller.isPassVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: MyDefinition.SECONDARY_COLOR_2,
                  ),
                ),
              ),
              obscureText: !controller.isPassVisible.value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Vui lòng nhập mật khẩu!';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
