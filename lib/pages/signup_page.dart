import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/sign_up_controller.dart';
import 'package:myapp/utils/my_definition.dart';

class SignUpPage extends GetView<SignUpController> {
  SignUpPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                const SizedBox(height: 31),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 47),
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Tạo tài khoản',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: MyDefinition.SECONDARY_COLOR_1,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Đăng ký để bắt đầu!',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: MyDefinition.SECONDARY_COLOR_2,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 47,
                          ),
                          _buildComponent(),
                          const SizedBox(
                            height: 32,
                          ),
                          _buildComponent2(),
                          const SizedBox(
                            height: 32,
                          ),
                          _buildComponent3(),
                          const SizedBox(
                            height: 32,
                          ),
                          _buildComponent4(),
                          const SizedBox(
                            height: 64,
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
                              'Tạo tài khoản',
                              style: TextStyle(
                                  color: MyDefinition.TEXT_BUTTON_COLOR,
                                  fontSize: MyDefinition.PRIMARY_FONT_SIZE),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'Hoặc',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Text(
                            'Đăng nhập với',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton.icon(
                                  style: ButtonStyle(
                                    minimumSize: const MaterialStatePropertyAll(
                                        Size(150, 30)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    side: const MaterialStatePropertyAll(
                                      BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/images/google.png',
                                    width: 22,
                                    height: 22,
                                  ),
                                  label: const Text(
                                    'Google',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: MyDefinition.SECONDARY_COLOR_1,
                                    ),
                                  ),
                                ),
                                TextButton.icon(
                                  style: ButtonStyle(
                                    minimumSize: const MaterialStatePropertyAll(
                                        Size(150, 30)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    side: const MaterialStatePropertyAll(
                                      BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/images/facebook.png',
                                    width: 22,
                                    height: 22,
                                  ),
                                  label: const Text(
                                    'Facebook',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: MyDefinition.SECONDARY_COLOR_1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Nếu bạn đã có tài khoản?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: MyDefinition.SECONDARY_COLOR_1),
                                ),
                                TextSpan(
                                  text: ' Đăng nhập',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue[500],
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.snackbar(
                                        'Move to Login page', 'Login page',
                                        snackPosition: SnackPosition.BOTTOM),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
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
            'Họ tên',
            style: TextStyle(
              fontSize: 14,
              color: MyDefinition.SECONDARY_COLOR_1,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          TextFormField(
            controller: controller.nameController,
            decoration: InputDecoration(
              prefixIconColor: MyDefinition.SECONDARY_COLOR_2,
              hintText: 'Nhập họ và tên...',
              hintStyle: const TextStyle(
                  color: MyDefinition.SECONDARY_COLOR_2,
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: const Icon(Icons.person_outline_outlined),
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
                return 'Vui lòng nhập email!';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildComponent3() {
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Số điện thoại',
            style: TextStyle(
              fontSize: 14,
              color: MyDefinition.SECONDARY_COLOR_1,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          TextFormField(
            controller: controller.phoneController,
            decoration: InputDecoration(
              prefixIconColor: MyDefinition.SECONDARY_COLOR_2,
              hintText: 'Nhập số điện thoại...',
              hintStyle: const TextStyle(
                  color: MyDefinition.SECONDARY_COLOR_2,
                  fontSize: 12,
                  fontWeight: FontWeight.w300),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: const Icon(Icons.phone_in_talk_outlined),
              contentPadding: const EdgeInsets.only(
                top: 16,
                right: 38,
                bottom: 16,
              ),
              border: const OutlineInputBorder(borderSide: BorderSide.none),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Vui lòng nhập số điện thoại!';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildComponent4() {
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
