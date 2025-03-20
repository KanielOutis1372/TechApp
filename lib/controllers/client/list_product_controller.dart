import 'package:get/get.dart';
import 'package:myapp/models/category.dart';

import '../../models/product.dart';
import '../../services/client/product_service.dart';

enum SortOption { ascending, descending }

class ListProductController extends GetxController {
  final products = <Product>[].obs;
  final sortOption = SortOption.ascending.obs; 
  var isLoadingProduct = true.obs;
  Category? category;

  void fetchProductsByCateId() async {
    try {
      isLoadingProduct(true); // Bắt đầu hiển thị trạng thái loading
      final List<Product> fetchedProducts =
          await ProductService().getProductsByCateID(category!.id);
      products.assignAll(fetchedProducts);
      isLoadingProduct(false);
    } catch (e) {
      // Xử lý lỗi khi fetch dữ liệu
    }
    // finally {
    //   isLoadingProduct(false); // Kết thúc hiển thị trạng thái loading
    // }
  }

  void sortProducts() {
    isLoadingProduct(true);
    // Thực hiện sắp xếp danh sách sản phẩm dựa trên giá trị của sortOption
    if (sortOption.value == SortOption.ascending) {
      products.sort((a, b) => a.price.compareTo(b.price));
    } else {
      products.sort((a, b) => b.price.compareTo(a.price));
    }
    isLoadingProduct(false);
  }

  @override
  void onInit() {
    super.onInit();
    category = Get.arguments ?? '';
    fetchProductsByCateId();
  }
}
