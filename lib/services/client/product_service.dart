import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/product.dart';
import '../../utils/base_config.dart';

class ProductService extends GetConnect {
  Future<List<Product>> getProducts() async {
    final response = await get(BaseConfig.GET_ALL_PRODUCT);

    if (response.statusCode == 200) {
      // Nếu request thành công, chuyển đổi dữ liệu JSON thành danh sách các đối tượng Category
      dynamic jsonData = jsonDecode(response.body);
      // Truy cập vào mảng response
      List<dynamic> data = jsonData['response']['products'];
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      // Nếu request thất bại, ném một ngoại lệ
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> getProductsByCateID(int cateId) async {
    final response =
        await get('${BaseConfig.GET_ALL_PRODUCT_BY_CATE_ID}?cate_id=$cateId');

    if (response.statusCode == 200) {
      // Nếu request thành công, chuyển đổi dữ liệu JSON thành danh sách các đối tượng Category
      dynamic jsonData = jsonDecode(response.body);
      // Truy cập vào mảng response
      List<dynamic> data = jsonData['response']['products'];
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      // Nếu request thất bại, ném một ngoại lệ
      throw Exception('Failed to load categories');
    }
  }

  Future<Product> getProductByID(int productID) async {
    final response =
        await get('${BaseConfig.GET_PRODUCT}?product_id=$productID');
    if (response.statusCode == 200) {
      dynamic jsonData = jsonDecode(response.body);
      var data = jsonData['response']['product'][0];
      return Product.fromJson(data);
    } else {
      // Nếu request thất bại, ném một ngoại lệ
      throw Exception('Failed to load product');
    }
  }

  Future<List<Product>> searchProduct(var keysearch) async {
    final response = await get('${BaseConfig.SEARCH_PRODUCT}?key=$keysearch');

    if (response.statusCode == 200) {
      // Nếu request thành công, chuyển đổi dữ liệu JSON thành danh sách các đối tượng Category
      dynamic jsonData = jsonDecode(response.body);
      // Truy cập vào mảng response
      List<dynamic> data = jsonData['response']['products'];
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      // Nếu request thất bại, ném một ngoại lệ
      throw Exception('Failed to load products');
    }
  }

  Future<String> deleteProduct(int id) async {
    try {
      final response =
          await delete('${BaseConfig.DELETE_PRODUCT}?productId=$id');
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        String data = res['resp'];
        return data;
      } else {
        throw Exception('Failed to delete product');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> addProduct(
      var name, var price, var quantity, var description, var cateId) async {
    try {
      final Map<String, dynamic> body = {
        'name': name,
        'description': description,
        'price': price,
        'quantity': quantity,
        'cate_id': cateId,
      };

      final response = await post(BaseConfig.ADD_PRODUCT, jsonEncode(body));
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        int data = res['lastID'];
        return data;
      } else {
        throw Exception('Failed to add product');
      }
    } catch (e) {
      return 0;
      // throw Exception('Exception: $e');
    }
  }

  Future<String> uploadImages(List<XFile> images, int productId) async {
    var formData = FormData({
      'product_id': productId.toString(),
    });

    for (var image in images) {
      formData.files.add(MapEntry(
          'images[]',
          MultipartFile(File(image.path),
              filename: image.path
                  .split('/')
                  .last))); // Thêm các file ảnh vào formData
    }
    try {
      var response = await post(BaseConfig.UPLOAD_IMAGES, formData);
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        String data = res['resp'];
        return data;
      }
      return "";
    } catch (e) {
      throw Exception(e);
    }
  }
}
