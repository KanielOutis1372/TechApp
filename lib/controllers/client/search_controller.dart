import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/client/export_controllers.dart';

import '../../models/product.dart';
import '../../services/client/product_service.dart';

class MySearchController extends GetxController {
  HomeController homeController = Get.find<HomeController>();
  var products = [].obs;
  var isLoadingProduct = false.obs;
  TextEditingController searchController = TextEditingController();

  void fetchProducts(var keysearch) async {
    try {
      isLoadingProduct(true); // Bắt đầu hiển thị trạng thái loading
      final List<Product> fetchedProducts =
          await ProductService().searchProduct(keysearch);
      products.assignAll(fetchedProducts);
      isLoadingProduct(false);
    } catch (e) {
      // Xử lý lỗi khi fetch dữ liệu
      isLoadingProduct(false);
    }
  }
}
