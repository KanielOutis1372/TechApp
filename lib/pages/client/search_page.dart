// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/client/cart_controller.dart';
import 'package:myapp/widgets/product_grid_widget.dart';

import '../../controllers/client/search_controller.dart';

class MySearchPage extends GetView<MySearchController> {
  MySearchPage({super.key});

  CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 60),
                child: TextField(
                  controller: controller.searchController,
                  decoration: const InputDecoration(
                    hintText: 'Tìm kiếm...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (value) {
                    controller.fetchProducts(controller.searchController.text);
                  },
                ),
              ),
            ),
            IconButton(
                onPressed: () =>
                    controller.fetchProducts(controller.searchController.text),
                icon: const Icon(Icons.search)),
          ],
        ),
        body: Obx(
          () => controller.products.isEmpty
              ? const Align(
                  child: Text("Không có sản phẩm nào"),
                )
              : Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ProductGrid(
                      controller: controller,
                      cartController: cartController,
                      isReverse: false),
                ),
        ),
      ),
    );
  }
}
