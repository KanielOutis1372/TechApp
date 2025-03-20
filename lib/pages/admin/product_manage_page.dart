import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/admin/product_manage_controller.dart';
import 'package:myapp/routes/app_routes.dart';

import '../../utils/base_config.dart';
import '../../utils/my_definition.dart';

class ProductManagePage extends GetView<ProductManageController> {
  const ProductManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: MyDefinition.SECONDARY_COLOR_2,
            onPressed: () => Get.back(),
          ),
          title: Align(child: Text('${controller.category?.name}')),
          actions: [
            // IconButton(
            //   icon: const Icon(Icons.search),
            //   onPressed: () {
            //     // Xử lý khi người dùng bấm nút tìm kiếm
            //   },
            // ),
            IconButton(
              icon: const Icon(Icons.add),
              color: MyDefinition.SECONDARY_COLOR_2,
              onPressed: () => Get.toNamed(AppRoutes.ADD_UPDATE_PRODUCT,
                  arguments: {'cate_id': controller.category!.id}),
            ),
          ],
        ),
        body: Column(
          children: [
            Obx(
              () => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Vị trí của bóng đổ
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Số lượng :',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${controller.products.length} (sản phẩm)',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => controller.isLoadingProduct.value
                  ? const Align(child: LinearProgressIndicator())
                  : const ProductListView(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListView extends GetView<ProductManageController> {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.products.isEmpty
          ? const Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text('Không có dữ liệu'),
              ),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return Slidable(
                    key: ValueKey(index),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) => Get.toNamed(
                              AppRoutes.ADD_UPDATE_PRODUCT,
                              arguments: {'product_id': product.id}),
                          backgroundColor: const Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.update,
                          label: 'Cập nhật',
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) =>
                              controller.deleteProduct(product.id),
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Xóa',
                        ),
                      ],
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              '${BaseConfig.BASE_URL_E}/${product.images[0].imageUrl}',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text('Giá: ${product.price} VNĐ'),
                                const SizedBox(height: 8),
                                Text(
                                  'Mô tả: ${product.description}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                // Text('Danh mục: ${product.categoryName}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
