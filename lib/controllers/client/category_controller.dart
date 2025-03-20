import 'package:get/get.dart';
import 'package:myapp/models/category.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    categories.value = Get.arguments ?? [];
  }
}
