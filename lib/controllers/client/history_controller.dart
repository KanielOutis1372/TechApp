import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/models/order.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';
import '../../services/client/order_service.dart';

class HistoryController extends GetxController {
  User? currentUser;
  var isLoginned = false.obs;
  var orders = <Order>[].obs; // continue code

  void checkLogedIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user')) {
      isLoginned(true);
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user');
      if (userJson != null) {
        final userMap = jsonDecode(userJson);
        currentUser = User.fromJson(userMap);
        loadOrders(currentUser!.id);
      }
    } else {
      isLoginned(false);
    }
  }

  void loadOrders(int userID) async {
    try {
      var fetchedOrders = await OrderService().getOrdersByUserID(userID);
      orders.assignAll(fetchedOrders);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkLogedIn();
  }
}
