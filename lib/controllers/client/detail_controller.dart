// ignore_for_file: must_call_super

import 'package:get/get.dart';
import 'package:myapp/controllers/client/export_controllers.dart';
import 'package:myapp/models/product.dart';

class DetailController extends GetxController {
  final favorCtrl = Get.find<FavorController>();
  var isFavor = false.obs;
  var currentPage = 0.obs;
  Product? product;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void toggleFavorite() {
    isFavor.value = !isFavor.value;
    if (isFavor.value) {
      favorCtrl.addToFavorites(product!);
    } else {
      favorCtrl.removeFromFavorites(product!);
    }
  }

  @override
  void onInit() {
    product = Get.arguments ?? '';
    if (favorCtrl.favoriteProducts.contains(product)) {
      isFavor.value = true;
    }
  }
}
