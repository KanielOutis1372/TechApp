import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/product.dart';

class FavorController extends GetxController {
  var favoriteProducts = <Product>[].obs;

  void addToFavorites(Product product) async {
    if (!favoriteProducts.contains(product)) {
      favoriteProducts.add(product);
      await _saveFavoritesToPrefs();
      Get.snackbar('Yêu thích', 'Đã thêm sản phẩm vào danh sách yêu thích!');
    } else {
      Get.snackbar('Yêu thích', 'Sản phẩm đã có trong danh sách yêu thích!');
    }
  }

  void removeFromFavorites(Product product) async {
    if (favoriteProducts.contains(product)) {
      favoriteProducts.remove(product);
      await _saveFavoritesToPrefs();
      Get.snackbar('Yêu thích', 'Đã xóa sản phẩm khỏi danh sách yêu thích!');
    }
  }

  Future<void> _saveFavoritesToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favoriteProductsJson = favoriteProducts
        .map((product) => json.encode(product.toJson()))
        .toList();
    await prefs.setStringList('favoriteProducts', favoriteProductsJson);
  }

  Future<void> _loadFavoritesFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favoriteProductsJson =
        prefs.getStringList('favoriteProducts');
    if (favoriteProductsJson != null) {
      favoriteProducts.value = favoriteProductsJson
          .map((jsonString) => Product.fromJson(json.decode(jsonString)))
          .toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    _loadFavoritesFromPrefs();
  }
}
