import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/utils/base_config.dart';

import '../../models/category.dart';

class CategoryService extends GetConnect {
  Future<List<Category>> getCategories() async {
    final response = await get(BaseConfig.GET_ALL_CATEGORY);

    if (response.statusCode == 200) {
      // Nếu request thành công, chuyển đổi dữ liệu JSON thành danh sách các đối tượng Category
      dynamic jsonData = jsonDecode(response.body);
      // Truy cập vào mảng response
      List<dynamic> data = jsonData['response'];
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      // Nếu request thất bại, ném một ngoại lệ
      throw Exception('Failed to load categories');
    }
  }

  Future<String> updateCategory(int id, String name) async {
    try {
      final Map<String, dynamic> body = {
        'id': id,
        'name': name,
      };

      final response = await post(BaseConfig.UPDATE_CATEGORY, jsonEncode(body));
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);
        return data['message'];
      } else {
        return "";
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }

  Future<String> deleteCategory(int id) async {
    try {
      final response = await delete("${BaseConfig.DELETE_CATEGORY}?id=$id");
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);
        return data['message'];
      } else {
        return "";
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }

  Future<String> addCategory(String name) async {
    var body = {'name': name};
    try {
      final response = await post(BaseConfig.ADD_CATEGORY, jsonEncode(body));
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);
        return data['message'];
      } else {
        return "";
      }
    } catch (e) {
      throw Exception('Exception: $e');
    }
  }
}
