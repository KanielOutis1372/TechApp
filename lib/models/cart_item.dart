import 'package:get/get.dart';

import 'product.dart';

class CartItem {
  final Product product;
  final RxInt quantity;
  final RxBool isSelected;

  CartItem({required this.product, required int quantity})
      : quantity = quantity.obs,
        isSelected = false.obs;
}
