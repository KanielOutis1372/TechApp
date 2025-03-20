import 'package:get/get.dart';

import '../../models/category.dart';
import '../../services/client/category_service.dart';

class ProductCateController extends GetxController {
  var categories = <Category>[].obs;
  var isLoadingCate = false.obs;

  void fetchCategories() async {
    try {
      isLoadingCate(true); // Bắt đầu hiển thị trạng thái loading
      final List<Category> fetchedCategories =
          await CategoryService().getCategories();
      categories.assignAll(fetchedCategories);
      isLoadingCate(false);
    } catch (e) {
      isLoadingCate(true);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
}
