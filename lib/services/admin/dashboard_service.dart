import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/utils/base_config.dart';

class DashboardService extends GetConnect {
  Future<Map<String, dynamic>> getDashboardData() async {
    try {
      final response = await get(BaseConfig.DASHBOARD_ADMIN);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'];
      } else {
        throw Exception('Failed to load dashboard data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
