import 'package:get/get.dart';
import 'package:myapp/models/category.dart';
import '../../models/product.dart';
import '../../services/client/product_service.dart';

class ProductManageController extends GetxController {
  final products = <Product>[].obs;
  Category? category;
  var isLoadingProduct = false.obs;

  void fetchProductsByCateId() async {
    try {
      isLoadingProduct(true);
      final List<Product> fetchedProducts =
          await ProductService().getProductsByCateID(category!.id);
      products.assignAll(fetchedProducts);
      isLoadingProduct(false);
    } catch (e) {
      // Xử lý lỗi khi fetch dữ liệu
      isLoadingProduct(false);
    }
  }

  void deleteProduct(int id) async {
    try {
      isLoadingProduct(true);
      //delete
      products.removeWhere(
        (element) => element.id == id,
      );
      //req delete
      var resp = await ProductService().deleteProduct(id);
      Get.snackbar("Thông báo", resp);
      isLoadingProduct(false);
    } catch (e) {
      isLoadingProduct(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    category = Get.arguments;
    fetchProductsByCateId();
  }
}
