import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/client/account_controller.dart';
import 'package:myapp/controllers/client/cart_controller.dart';
import 'package:myapp/controllers/client/payment_controller.dart';

import '../../models/cart_item.dart';
import '../../routes/app_routes.dart';
import '../../utils/base_config.dart';
import '../../utils/helper.dart';
import '../../utils/my_definition.dart';
import '../../widgets/button_widget.dart';

class PaymentPage extends GetView<PaymentController> {
  PaymentPage({super.key});
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    final accCtrl = Get.find<AccountController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              color: MyDefinition.SECONDARY_COLOR_2,
              size: MyDefinition.FONT_SIZE_ICON,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: const Text(
            'Đặt hàng',
            style: TextStyle(
              fontSize: MyDefinition.PRIMARY_FONT_SIZE + 2,
              color: MyDefinition.SECONDARY_COLOR_1,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: MyDefinition.SECONDARY_COLOR_2,
                      size: MyDefinition.FONT_SIZE_ICON,
                    ), // Biểu tượng giỏ hàng
                    onPressed: () {
                      // Xử lý khi người dùng nhấn vào biểu tượng giỏ hàng
                    },
                  ),
                  Positioned(
                    right: 6,
                    top: 2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Center(
                        child: Obx(
                          () => Text(
                            '${controller.totalItem.value}', // Số lượng sản phẩm trong giỏ hàng
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Divider(
              color: Colors.grey[300],
              thickness: 1,
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: MyDefinition.PADDING_HORI, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Giao tới:',
                    style: TextStyle(
                      fontSize: MyDefinition.SUB_FONT_SIZE,
                      color: MyDefinition.SECONDARY_COLOR_1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        accCtrl.currentUser == null
                            ? 'Chưa có địa chỉ'
                            : accCtrl.currentUser!.deliveryAddress,
                        style: const TextStyle(
                          fontSize: MyDefinition.SUB_FONT_SIZE,
                          color: MyDefinition.SECONDARY_COLOR_1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
              height: 1,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.cartItemsOrder.length,
                  itemBuilder: (context, index) {
                    final CartItem cartItem = controller.cartItemsOrder[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      constraints: const BoxConstraints(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: CartItemOrderWidget(
                        cartItem: cartItem,
                        controller: controller,
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tổng thanh toán',
                        style: TextStyle(
                            fontSize: MyDefinition.PRIMARY_FONT_SIZE - 1,
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.bottomSheet(
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white, // Màu nền
                                borderRadius:
                                    BorderRadius.circular(12.0), // Góc bo tròn
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Thông tin đặt hàng',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MyDefinition.PRIMARY_FONT_SIZE),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Người đặt:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                MyDefinition.PRIMARY_FONT_SIZE),
                                      ),
                                      Text(
                                        controller.currentUser?.username == null
                                            ? ""
                                            : controller.currentUser!.username,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                MyDefinition.PRIMARY_FONT_SIZE),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Email:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                MyDefinition.PRIMARY_FONT_SIZE),
                                      ),
                                      Text(
                                        controller.currentUser?.email == null
                                            ? ""
                                            : controller.currentUser!.email,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                MyDefinition.PRIMARY_FONT_SIZE),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Số điện thoại:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                MyDefinition.PRIMARY_FONT_SIZE),
                                      ),
                                      Text(
                                        controller.currentUser?.phoneNumber ==
                                                null
                                            ? ""
                                            : controller
                                                .currentUser!.phoneNumber,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                MyDefinition.PRIMARY_FONT_SIZE),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Địa chỉ:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                MyDefinition.PRIMARY_FONT_SIZE),
                                      ),
                                      Text(
                                        controller.currentUser
                                                    ?.deliveryAddress ==
                                                null
                                            ? ""
                                            : controller
                                                .currentUser!.deliveryAddress,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                MyDefinition.PRIMARY_FONT_SIZE),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng (${controller.totalItem} mặt hàng)', // Thay bằng giá trị thực
                        style: const TextStyle(
                            fontSize: MyDefinition.SUB_FONT_SIZE,
                            fontWeight: FontWeight.w500),
                      ),
                      Obx(
                        () => Text(
                          '${Helper().formatNumber(controller.totalAmount.value)} vnđ', // Thay bằng giá trị thực
                          style: const TextStyle(
                              fontSize: MyDefinition.SUB_FONT_SIZE,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phương thức thanh toán', // Thay bằng giá trị thực
                        style: TextStyle(
                            fontSize: MyDefinition.SUB_FONT_SIZE,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Nhận hàng thanh toán', // Thay bằng giá trị thực
                        style: TextStyle(
                            fontSize: MyDefinition.SUB_FONT_SIZE,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    width: double.infinity,
                    title: 'Đặt hàng ngay',
                    btnColor: MyDefinition.PRIMARY_COLOR,
                    textColor: MyDefinition.TEXT_BUTTON_COLOR,
                    func: () {
                      //check login?
                      // controller.checkLogedIn();
                      if (controller.isLoginned.value) {
                        // gửi đơn hàng tới server
                        controller.orderNow();
                      } else {
                        Get.bottomSheet(
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white, // Màu nền
                              borderRadius:
                                  BorderRadius.circular(12.0), // Góc bo tròn
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Bạn chưa đăng nhập?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: MyDefinition.PRIMARY_FONT_SIZE),
                                ),
                                const SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () =>
                                          Get.toNamed(AppRoutes.SIGN_IN_PAGE),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            MyDefinition.SECONDARY_COLOR_2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: const BorderSide(
                                              color:
                                                  MyDefinition.PRIMARY_COLOR),
                                        ),
                                      ),
                                      child: const Text(
                                        'Đăng nhập',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              MyDefinition.PRIMARY_FONT_SIZE -
                                                  1,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () =>
                                          Get.toNamed(AppRoutes.SIGN_UP_PAGE),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            MyDefinition.SECONDARY_COLOR_2,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: const BorderSide(
                                                color: MyDefinition
                                                    .PRIMARY_COLOR)),
                                      ),
                                      child: const Text(
                                        'Đăng ký',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              MyDefinition.PRIMARY_FONT_SIZE -
                                                  1,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemOrderWidget extends StatelessWidget {
  const CartItemOrderWidget({
    super.key,
    required this.cartItem,
    required this.controller,
  });

  final CartItem cartItem;
  final PaymentController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    '${BaseConfig.BASE_URL_E}/${cartItem.product.images[0].imageUrl}',
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MyDefinition.PRIMARY_FONT_SIZE - 2,
                        ),
                      ),
                      Text(
                        cartItem.product.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: MyDefinition.SECONDARY_COLOR_2,
                          fontSize: MyDefinition.SUB_FONT_SIZE - 2,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${Helper().formatNumber(cartItem.product.price)} vnđ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MyDefinition.SUB_FONT_SIZE - 2,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Số lượng: ${cartItem.quantity}',
                              style: const TextStyle(
                                color: MyDefinition.PRIMARY_COLOR,
                                fontSize: MyDefinition.SUB_FONT_SIZE - 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
