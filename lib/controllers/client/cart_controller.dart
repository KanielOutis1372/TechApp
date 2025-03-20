import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_item.dart';
import '../../models/product.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var cartItemsOrder = <CartItem>[].obs;
  var totalAmount = 0.obs;
  var totalItem = 0.obs;

  addToCartItemsOrder(CartItem cartItem) {
    cartItemsOrder.add(cartItem);
  }

  removeCartItemOrder(int productId) {
    cartItemsOrder.removeWhere((element) => element.product.id == productId);
  }

  void increaseQuantity(CartItem cartItem) {
    cartItem.quantity.value++;
    calculateTotalItem();
    calculateTotalAmount();
  }

  void decreaseQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity.value--;
      calculateTotalItem();
      calculateTotalAmount();
    }
  }

  void removeCartItem(int productId) {
    cartItems.removeWhere((element) => element.product.id == productId);
    CartStorage.saveCart(cartItems);
    calculateTotalAmount();
    calculateTotalItem();
    removeCartItemOrder(productId);
  }

  void calculateTotalItem() {
    totalItem.value = cartItems.length;
  }

  void calculateTotalAmount() {
    var total = 0;
    for (var cartItem in cartItems) {
      total += cartItem.product.price * cartItem.quantity.value;
    }
    totalAmount.value = total;
  }

  void addToCart(CartItem cartItem) {
    final existingItem = cartItems.firstWhereOrNull(
      (element) => element.product.id == cartItem.product.id,
    );

    if (existingItem != null) {
      existingItem.quantity.value++;
    } else {
      cartItems.add(cartItem);
    }
    CartStorage.saveCart(cartItems);
    calculateTotalItem();
    calculateTotalAmount();
  }

  void loadCart() async {
    List<CartItem> savedCart = await CartStorage.getCart();
    cartItems.assignAll(savedCart);
    calculateTotalItem();
    calculateTotalAmount();
  }

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }
}

class CartStorage {
  static const String _cartKey = 'cart';

  static Future<void> saveCart(List<CartItem> cartItems) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> cartJsonList = cartItems
        .map((cartItem) => {
              'product': cartItem.product.toJson(),
              'quantity': cartItem.quantity.value,
              'isSelected': cartItem.isSelected.value,
            })
        .toList();
    final String cartJson = jsonEncode(cartJsonList);
    await prefs.setString(_cartKey, cartJson);
  }

  static Future<List<CartItem>> getCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? cartJson = prefs.getString(_cartKey);
    if (cartJson != null) {
      final List<dynamic> cartList = jsonDecode(cartJson);
      return cartList
          .map((json) => CartItem(
                product: Product.fromJson(json['product']),
                quantity: RxInt(json['quantity']).value,
              ))
          .toList();
    }
    return [];
  }
}
