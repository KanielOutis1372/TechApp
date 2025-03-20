// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/client/export_controllers.dart';
import 'package:myapp/models/cart_item.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/utils/base_config.dart';
import 'package:myapp/widgets/button_widget.dart';

import '../../utils/helper.dart';
import '../../utils/my_definition.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController accCtrl = Get.find();
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
            'Giỏ hàng của bạn',
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
                            '${controller.totalItem.value}',
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
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final CartItem cartItem = controller.cartItems[index];
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
                      child: CartItemWidget(
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng đơn giá giỏ hàng',
                        style: TextStyle(
                            fontSize: MyDefinition.PRIMARY_FONT_SIZE - 1,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tổng', // Thay bằng giá trị thực
                        style: TextStyle(
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
                  ButtonWidget(
                    width: double.infinity,
                    title: 'Thanh toán',
                    btnColor: MyDefinition.PRIMARY_COLOR,
                    textColor: MyDefinition.TEXT_BUTTON_COLOR,
                    func: () {
                      // chuyển tới trang đặt hàng
                      Get.toNamed(AppRoutes.PAYMENT_PAGE);
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

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.controller,
  });

  final CartItem cartItem;
  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Checkbox(
              value: cartItem.isSelected.value,
              onChanged: (value) {
                cartItem.isSelected.value = value ?? false;
                if (value == true) {
                  // Get.snackbar('add to list order', 'add');
                  //thêm vào danh sách order
                  controller.addToCartItemsOrder(cartItem);
                } else {
                  // remove cartItem khỏi danh sách order
                  controller.removeCartItemOrder(cartItem.product.id);
                }
              },
              checkColor: Colors.white,
              fillColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  // Màu fill cho checkbox dựa trên trạng thái của checkbox
                  if (states.contains(WidgetState.selected)) {
                    // Trạng thái được chọn
                    return MyDefinition
                        .PRIMARY_COLOR; // Màu fill khi checkbox được chọn
                  }
                  return Colors
                      .white; // Màu fill mặc định khi checkbox không được chọn
                },
              ),
            ),
          ),
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
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 235, 232, 232),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        25), // Độ cong của góc
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () =>
                                          controller.decreaseQuantity(cartItem),
                                      icon: const Icon(
                                        Icons.remove,
                                        color: MyDefinition
                                            .PRIMARY_COLOR, // Màu của icon
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Obx(
                                  () => Text(
                                    '${cartItem.quantity.value}',
                                    style: const TextStyle(
                                      fontSize:
                                          MyDefinition.PRIMARY_FONT_SIZE - 4,
                                      color: MyDefinition.SECONDARY_COLOR_1,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 235, 232, 232)),
                                    borderRadius: BorderRadius.circular(
                                        25), // Độ cong của góc
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () =>
                                          controller.increaseQuantity(cartItem),
                                      icon: const Icon(
                                        Icons.add,
                                        color: MyDefinition.PRIMARY_COLOR,
                                        // Màu của icon
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 235, 232, 232),
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () => controller
                                          .removeCartItem(cartItem.product.id),
                                      icon: const Icon(
                                        Icons.delete_outlined,
                                        color: MyDefinition.PRIMARY_COLOR,
                                        size: MyDefinition.FONT_SIZE_ICON - 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
