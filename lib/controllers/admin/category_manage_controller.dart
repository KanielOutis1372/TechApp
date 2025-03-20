import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../models/category.dart';
import '../../services/client/category_service.dart';

class CategoryManageController extends GetxController {
  TextEditingController txtController = TextEditingController();
  var categories = <Category>[].obs;
  var isLoadingCate = false.obs;

  void fetchCategories() async {
    try {
      isLoadingCate(true);
      final List<Category> fetchedCategories =
          await CategoryService().getCategories();
      categories.assignAll(fetchedCategories);
      isLoadingCate(false);
    } catch (e) {
      isLoadingCate(true);
    }
  }

  void updateCategory(int id, String name) async {
    try {
      isLoadingCate(true);
      String mess = await CategoryService().updateCategory(id, name);
      if (mess.isNotEmpty) {
        Get.snackbar("Thành công", mess);
      } else {
        Get.snackbar("Thất bại", "Cập nhật thất bại!");
      }
      isLoadingCate(false);
    } catch (e) {
      Get.snackbar("Thất bại", "Cập nhật thất bại!");
      isLoadingCate(false);
    }
  }

  void DeleteCate(int id) async {
    try {
      isLoadingCate(true);
      String mess = await CategoryService().deleteCategory(id);
      if (mess.isNotEmpty) {
        Get.snackbar("Thành công", mess);
      } else {
        Get.snackbar("Thất bại", "Xóa thất bại!");
      }
      isLoadingCate(false);
    } catch (e) {
      Get.snackbar("Thất bại", "Xóa thất bại!");
      isLoadingCate(false);
    }
  }

  void AddCate() async {
    try {
      isLoadingCate(true);
      String mess =
          await CategoryService().addCategory(txtController.text.trim());
      if (mess.isNotEmpty) {
        Get.snackbar("Thành công", mess);
      } else {
        Get.snackbar("Thất bại", "Thêm mới thất bại!");
      }
      isLoadingCate(false);
    } catch (e) {
      Get.snackbar("Thất bại", "Thêm mới thất bại!");
      isLoadingCate(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
}
