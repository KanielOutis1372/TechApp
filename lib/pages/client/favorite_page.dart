import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/client/export_controllers.dart';

import '../../utils/my_definition.dart';
import '../../widgets/ProductCard.dart';

class FavoritePage extends GetView<FavorController> {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Sản phẩm yêu thích',
            style: TextStyle(
              fontSize: MyDefinition.PRIMARY_FONT_SIZE + 2,
              color: MyDefinition.SECONDARY_COLOR_1,
            ),
          ),
        ),
        body: Obx(
          () => controller.favoriteProducts.isEmpty
              ? const Align(
                  child: Text('Không có dữ liệu'),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0, // Khoảng cách giữa các cột
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: controller.favoriteProducts.length,
                  itemBuilder: (context, index) {
                    final product = controller.favoriteProducts[index];
                    return ProductCard(product: product);
                  },
                ),
        ),
      ),
    );
  }
}
