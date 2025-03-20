import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/models/order_manage.dart';

import '../../utils/base_config.dart';

class OrderService extends GetConnect {
  Future<Map<String, dynamic>> getOrderCounter() async {
    try {
      final response = await get(BaseConfig.ORDER_COUNTER);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'];
      } else {
        throw Exception('Failed to get counter data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<OrderManage>> fetchOrders(bool status) async {
    try {
      final response = await get('${BaseConfig.ORDER_LIST}?status=$status');
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        List<dynamic> data = res['orders'];
        return data.map((e) => OrderManage.fromJson(e)).toList();
      } else {
        throw Exception('Failed to get orders');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<String> approveOrder(int id) async {
    try {
      Map<String, dynamic> param = {
        'orderId': id,
      };
      final response = await put(BaseConfig.APPROVE_ORDER, param);
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        String data = res['resp'];
        return data;
      } else {
        throw Exception('Failed to approve order');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> deleteOrder(int id) async {
    try {
      final response = await delete('${BaseConfig.DELETE_ORDER}?orderId=$id');
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        String data = res['resp'];
        return data;
      } else {
        throw Exception('Failed to delete order');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
