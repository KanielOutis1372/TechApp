import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/services/client/product_service.dart';

import '../../models/product.dart';

class AddOrUpdateProductController extends GetxController {
  int? cate_id;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  var imageFileList = <XFile>[].obs;
  int? product_id;
  Product? product;

  var isLoading = false.obs;

  void pickImages() async {
    try {
      final List<XFile> pickedFileList = await _picker.pickMultiImage();
      imageFileList.addAll(pickedFileList);
    } catch (e) {
      Get.snackbar('Error', 'Error picking images: $e');
    }
  }

  void addProduct() async {
    try {
      isLoading(true);
      int lastId = await ProductService().addProduct(
          nameController.text,
          int.parse(priceController.text),
          int.parse(quantityController.text),
          descriptionController.text,
          cate_id);
      if (lastId != 0) {
        var resp =
            await ProductService().uploadImages(imageFileList.toList(), lastId);
        if (resp != "") {
          Get.snackbar("Thành công", resp);
          return;
        }
      } else {
        Get.snackbar('Thất bại', 'Thêm sản phẩm mới thất bại!!!');
      }
      isLoading(false);
    } catch (e) {
      isLoading(true);
    }
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      product = await ProductService().getProductByID(product_id!);
      nameController.text = product!.name;
      priceController.text = product!.price.toString();
      quantityController.text = product!.quantity.toString();
      descriptionController.text = product!.description;
      if (product != null && product!.images.isNotEmpty) {}
      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    product_id = args['product_id'];
    cate_id = args['cate_id'];
    if (product_id != null) {
      fetchProduct();
    }
  }
}
