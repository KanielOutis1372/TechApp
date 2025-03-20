import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/utils/base_config.dart';

import '../../models/user.dart';

class UserSerive extends GetConnect {
  Future<bool> register(User user) async {
    try {
      final response = await post(BaseConfig.SIGN_UP, user.toJson());
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> login(String email, String password) async {
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    final response = await post(BaseConfig.SIGN_IN, data);
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      dynamic user = res['user'];
      return User.fromJson(user);
    } else if (response.statusCode == 401) {
      final res = jsonDecode(response.body);
      return res['message'];
    }
    return null;
  }

  
}
