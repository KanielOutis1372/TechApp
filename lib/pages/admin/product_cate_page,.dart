// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/admin/product_cate_controller.dart';

import '../../routes/app_routes.dart';
import '../../utils/my_definition.dart';
import '../../widgets/cate_item_widget.dart';

class ProductCatePage extends GetView<ProductCateController> {
  const ProductCatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: MyDefinition.SECONDARY_COLOR_2,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: const Text(
            'Quản lý sản phẩm',
            style: TextStyle(
              fontSize: MyDefinition.PRIMARY_FONT_SIZE + 2,
              color: MyDefinition.SECONDARY_COLOR_1,
            ),
          ),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: MyDefinition.PADDING_HORI, vertical: 16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8, // Khoảng cách giữa các cột
                mainAxisSpacing: 6, // Khoảng cách giữa các dòng
                childAspectRatio: 0.8,
              ),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                var category = controller.categories[index];
                return CateItemWidget(
                  imgUrl: 'assets/images/tag.png',
                  name: category.name,
                  callF: () {
                    Get.toNamed(AppRoutes.PRODUCT_MANAGE,
                        arguments: category);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
