import 'dart:convert';

import 'package:get/get.dart';
import 'package:myapp/controllers/client/cart_controller.dart';
import 'package:myapp/services/client/payment_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_item.dart';
import '../../models/user.dart';

class PaymentController extends GetxController {
  var cartItemsOrder = <CartItem>[].obs;
  var totalAmount = 0.obs;
  var totalItem = 0.obs;
  User? currentUser;
  var isLoginned = false.obs;
  List<Map<String, dynamic>> products = [];

  void orderNow() async {
    // Xóa danh sách sản phẩm cũ trước khi tạo đơn hàng mới
    products.clear();

    for (CartItem cartItem in cartItemsOrder) {
      // Lấy thông tin của sản phẩm từ CartItem
      int productId = cartItem.product.id;
      int quantity = cartItem.quantity.value;

      // Tạo một mục cho danh sách products và thêm vào danh sách
      Map<String, dynamic> product = {
        'product_id': productId,
        'quantity': quantity,
      };
      products.add(product);
    }

    var userId = currentUser?.id;
    var totalPrice = totalAmount.value;

    var mess = await PaymentService().orderNow(userId!, products, totalPrice);

    Get.snackbar('Thông báo', mess);
  }

  void checkLogedIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user')) {
      isLoginned(true);
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user');
      if (userJson != null) {
        final userMap = jsonDecode(userJson);
        currentUser = User.fromJson(userMap);
      }
    } else {
      isLoginned(false);
    }
  }

  void calculateTotalItem() {
    totalItem.value = cartItemsOrder.length;
  }

  void calculateTotalAmount() {
    var total = 0;
    for (var item in cartItemsOrder) {
      total += item.product.price * item.quantity.value;
    }
    totalAmount.value = total;
  }

  @override
  void onInit() {
    super.onInit();
    cartItemsOrder = Get.find<CartController>().cartItemsOrder;
    calculateTotalItem();
    calculateTotalAmount();
    checkLogedIn();
  }
}
