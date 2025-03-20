import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/utils/base_config.dart';

import '../../models/account.dart';

class AccountService extends GetConnect {
  Future<List<Account>> fetchUsers() async {
    final response = await get(BaseConfig.GET_ALL_ACC);
    if (response.statusCode == 200) {
      dynamic responseData = jsonDecode(response.body);
      List<dynamic> users = responseData['users'];
      return users.map((json) => Account.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
