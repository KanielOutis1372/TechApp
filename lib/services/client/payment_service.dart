import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/utils/base_config.dart';

class PaymentService extends GetConnect {
  Future<String> orderNow(
      int userId, List<Map<String, dynamic>> products, int totalPrice) async {
    final Map<String, dynamic> data = {
      'user_id': userId,
      'products': products,
      'total_price': totalPrice,
    };

    final response = await post(BaseConfig.ORDER, data);

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      return res['message'];
    } else if (response.statusCode == 500) {
      final res = jsonDecode(response.body);
      return res['message'];
    } else {
      return '';
    }
  }
}
