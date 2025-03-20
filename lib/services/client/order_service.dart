import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/models/order.dart';

import '../../utils/base_config.dart';

class OrderService extends GetConnect {
  Future<List<Order>> getOrdersByUserID(int userID) async {
    final response =
        await get('${BaseConfig.GET_ORDERS_BY_USERID}?user_id=$userID');

    if (response.statusCode == 200) {
      // Nếu request thành công, chuyển đổi dữ liệu JSON thành danh sách các đối tượng Category
      dynamic jsonData = jsonDecode(response.body);
      // Truy cập vào mảng response
      List<dynamic> data = jsonData['response'];
      return data.map((json) => Order.fromJson(json)).toList();
    } else {
      // Nếu request thất bại, ném một ngoại lệ
      throw Exception('Failed to load orders');
    }
  }
}
