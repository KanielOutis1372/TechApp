import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/client/list_product_controller.dart';
import 'package:myapp/widgets/product_grid_widget.dart';

import '../../controllers/client/cart_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/my_definition.dart';

class ListProductPage extends GetView<ListProductController> {
  ListProductPage({super.key});

  final CartController cartController = Get.find<CartController>();

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
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: Text(
            controller.category!.name,
            style: const TextStyle(
              fontSize: MyDefinition.PRIMARY_FONT_SIZE + 2,
              color: MyDefinition.SECONDARY_COLOR_1,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 0),
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
            IconButton(
              icon: const Icon(
                Icons.filter_alt,
                color: MyDefinition.SECONDARY_COLOR_2,
                size: MyDefinition.FONT_SIZE_ICON,
              ),
              onPressed: () {
                _showFilterDialog(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: MyDefinition.PADDING_HORI, vertical: 16),
          child: Obx(
            () {
              if (controller.isLoadingProduct.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ProductGrid(
                  controller: controller,
                  cartController: cartController,
                  isReverse: false,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Lọc theo giá',
          style: TextStyle(color: MyDefinition.SECONDARY_COLOR_1),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => ListTile(
                title: const Text(
                  'Giá tăng dần',
                  style: TextStyle(color: MyDefinition.SECONDARY_COLOR_1),
                ),
                leading: Radio(
                  activeColor: MyDefinition.SECONDARY_COLOR_2,
                  value: SortOption.ascending,
                  groupValue: controller.sortOption.value,
                  onChanged: (value) {
                    controller.sortOption.value = value as SortOption;
                    controller.sortProducts();
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Obx(
              () => ListTile(
                title: const Text(
                  'Giá giảm dần',
                  style: TextStyle(color: MyDefinition.SECONDARY_COLOR_1),
                ),
                leading: Radio(
                  activeColor: MyDefinition.SECONDARY_COLOR_2,
                  value: SortOption.descending,
                  groupValue: controller.sortOption.value,
                  onChanged: (value) {
                    controller.sortOption.value = value as SortOption;
                    controller.sortProducts();
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
