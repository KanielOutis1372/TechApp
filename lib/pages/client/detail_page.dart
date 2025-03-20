// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/client/detail_controller.dart';
import 'package:myapp/utils/helper.dart';
import 'package:myapp/utils/my_definition.dart';

import '../../controllers/client/cart_controller.dart';
import '../../controllers/client/favor_controller.dart';
import '../../models/cart_item.dart';
import '../../routes/app_routes.dart';
import '../../utils/base_config.dart';
import '../../widgets/button_widget.dart';

class DetailPage extends GetView<DetailController> {
  DetailPage({super.key});

  final CartController cartController = Get.find<CartController>();
  final FavorController favorController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: MyDefinition.SECONDARY_COLOR_2,
              size: MyDefinition.FONT_SIZE_ICON - 10,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: const Text(
            'Chi tiết sản phẩm',
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
                    onPressed: () => Get.toNamed(AppRoutes.CART_PAGE),
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
                            '${cartController.totalItem.value}', // Số lượng sản phẩm trong giỏ hàng
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
        body: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: controller.product?.images.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    return Image.network(
                      '${BaseConfig.BASE_URL_E}/${controller.product?.images[index].imageUrl}',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Obx(() => Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.product!.images.length,
                        (index) => buildDot(
                            index, controller.currentPage.value == index),
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(0),
                child: ListTile(
                  title: Text(
                    '${controller.product?.name}',
                    style: const TextStyle(
                        fontSize: MyDefinition.PRIMARY_FONT_SIZE,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text.rich(
                      TextSpan(
                        text:
                            '${Helper().formatNumber(controller.product!.price)} vnđ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MyDefinition.PRIMARY_FONT_SIZE + 4),
                        children: const <TextSpan>[
                          TextSpan(
                            text: ' (Đã mua: 100)',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: MyDefinition.SUB_FONT_SIZE + 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  trailing: Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: IconButton(
                      icon: controller.isFavor.value
                          ? const Icon(
                              Icons.favorite_rounded,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            ),
                      onPressed: () {
                        controller.toggleFavorite();
                      },
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Mô tả sản phẩm',
                  style: TextStyle(
                      fontSize: MyDefinition.PRIMARY_FONT_SIZE,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Align(
                      child: Text(
                        Helper().formatString(controller.product!.description),
                        style: const TextStyle(
                          fontSize: MyDefinition.SUB_FONT_SIZE + 2,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                      width: 180.toDouble(),
                      title: 'Thêm vào giỏ',
                      btnColor: MyDefinition.SECONDARY_COLOR_2,
                      textColor: MyDefinition.TEXT_BUTTON_COLOR,
                      func: () {
                        cartController.addToCart(CartItem(
                            product: controller.product!, quantity: 1));
                        Get.snackbar(
                            'Thêm vào giỏ', 'Đã thêm sản phẩm vào giỏ hàng');
                      }),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ButtonWidget(
                      width: 180.toDouble(),
                      title: 'Mua ngay',
                      btnColor: Colors.grey[100],
                      textColor: MyDefinition.SECONDARY_COLOR_1,
                      func: () =>
                          Get.snackbar('Chuyển tới trang order', 'Order')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isActive
            ? MyDefinition.SECONDARY_COLOR_2
            : MyDefinition.PRIMARY_COLOR,
      ),
    );
  }
}
