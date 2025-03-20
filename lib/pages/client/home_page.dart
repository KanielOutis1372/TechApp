import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/client/home_controller.dart';
import 'package:myapp/routes/app_routes.dart';
import 'package:myapp/utils/my_definition.dart';

import '../../controllers/client/cart_controller.dart';
import '../../widgets/banner_widget.dart';
import '../../widgets/cate_item_widget.dart';
import '../../widgets/product_grid_widget.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Image.asset(
            'assets/images/logo.png',
            height: 30,
          ),
          centerTitle: true,
          actions: [
            Stack(
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
            // Stack(
            //   children: [
            //     IconButton(
            //       icon: const Icon(
            //         Icons.notifications_none_rounded,
            //         size: MyDefinition.FONT_SIZE_ICON,
            //         color: MyDefinition.SECONDARY_COLOR_2,
            //       ),
            //       onPressed: () {
            //         // Xử lý khi người dùng nhấn vào biểu tượng chuông thông báo
            //       },
            //     ),
            //     Positioned(
            //       right: 12,
            //       top: 10,
            //       child: Container(
            //         padding: const EdgeInsets.all(2),
            //         decoration: const BoxDecoration(
            //           color: Colors.red,
            //           shape: BoxShape.circle,
            //         ),
            //         constraints: const BoxConstraints(
            //           minWidth: 10,
            //           minHeight: 10,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              width: 8,
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 8,
            left: MyDefinition.PADDING_HORI,
            right: MyDefinition.PADDING_HORI,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.SEARCH_PAGE);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: MyDefinition.SECONDARY_COLOR_2,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Tìm kiếm...',
                        style: TextStyle(
                          color: MyDefinition.SECONDARY_COLOR_2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              const BannerWidget(),
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Danh mục',
                  style: TextStyle(
                    fontSize: MyDefinition.PRIMARY_FONT_SIZE,
                    fontWeight: FontWeight.w600,
                    color: MyDefinition.SECONDARY_COLOR_1,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(
                    () {
                      if (controller.isLoadingCate.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return CateItemWidget(
                          imgUrl: 'assets/images/tag.png',
                          name: controller.categories[0].name,
                          callF: () => Get.toNamed(AppRoutes.LIST_PRODUCT_PAGE,
                              arguments: controller.categories[0]),
                        );
                      }
                    },
                  ),
                  Obx(
                    () {
                      if (controller.isLoadingCate.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return CateItemWidget(
                          imgUrl: 'assets/images/tag.png',
                          name: controller.categories[1].name,
                          callF: () => Get.toNamed(AppRoutes.LIST_PRODUCT_PAGE,
                              arguments: controller.categories[1]),
                        );
                      }
                    },
                  ),
                  Obx(
                    () {
                      if (controller.isLoadingCate.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return CateItemWidget(
                          imgUrl: 'assets/images/tag.png',
                          name: controller.categories[2].name,
                          callF: () => Get.toNamed(AppRoutes.LIST_PRODUCT_PAGE,
                              arguments: controller.categories[2]),
                        );
                      }
                    },
                  ),
                  Obx(
                    () {
                      if (controller.isLoadingCate.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return CateItemWidget(
                          imgUrl: 'assets/images/tag.png',
                          name: controller.categories[3].name,
                          callF: () => Get.toNamed(AppRoutes.LIST_PRODUCT_PAGE,
                              arguments: controller.categories[3]),
                        );
                      }
                    },
                  ),
                  CateItemWidget(
                    imgUrl: 'assets/images/category.png',
                    name: 'Tất cả',
                    callF: () => Get.toNamed(AppRoutes.CATEGORY_PAGE,
                        arguments: controller.categories),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sản phẩm gần đây',
                  style: TextStyle(
                    fontSize: MyDefinition.PRIMARY_FONT_SIZE,
                    fontWeight: FontWeight.w600,
                    color: MyDefinition.SECONDARY_COLOR_1,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Obx(
                () {
                  if (controller.isLoadingProduct.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ProductGrid(
                      controller: controller,
                      cartController: cartController,
                      isReverse: true,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
