// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/models/category.dart';
import 'package:myapp/services/client/category_service.dart';
import 'package:myapp/services/client/product_service.dart';

import '../../models/product.dart';

class HomeController extends GetxController {
  var categories = <Category>[].obs;
  var products = <Product>[].obs;
  var isLoadingCate = true.obs;
  var isLoadingProduct = true.obs;

  var currentPage = 0.obs;
  final List<String> banners = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpeg',
    'assets/images/img4.jpg',
  ].obs;

  final PageController pageController = PageController(
    viewportFraction: 0.9,
  );

  void fetchCategories() async {
    try {
      isLoadingCate(true); // Bắt đầu hiển thị trạng thái loading
      final List<Category> fetchedCategories =
          await CategoryService().getCategories();
      categories.assignAll(fetchedCategories);
      isLoadingCate(false);
    } catch (e) {
      // Xử lý lỗi khi fetch dữ liệu
    }
    // finally {
    //   isLoadingCate(true); // Kết thúc hiển thị trạng thái loading
    // }
  }

  void fetchProducts() async {
    try {
      isLoadingProduct(true); // Bắt đầu hiển thị trạng thái loading
      final List<Product> fetchedProducts =
          await ProductService().getProducts();
      products.assignAll(fetchedProducts);
      isLoadingProduct(false);
    } catch (e) {
      // Xử lý lỗi khi fetch dữ liệu
    }
    // finally {
    //   isLoadingProduct(true); // Kết thúc hiển thị trạng thái loading
    // }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (pageController.hasClients) {
        int nextPage = currentPage.value + 1;
        if (nextPage >= banners.length) {
          nextPage = 0;
        }
        pageController.animateToPage(
          nextPage,
          duration: const Duration(
              milliseconds: 1000), // Tăng thời gian để chuyển động mượt hơn
          curve: Curves.ease, // Sử dụng đường cong mượt hơn
        );
        currentPage.value = nextPage;
      }
    });
  }
}
