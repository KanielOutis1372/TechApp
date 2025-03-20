// ignore_for_file: annotate_overrides, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/models/cart_item.dart';
import 'package:myapp/utils/base_config.dart';
import 'package:myapp/utils/helper.dart';

import '../controllers/client/cart_controller.dart';
import '../routes/app_routes.dart';
import '../utils/my_definition.dart';

class ProductGrid extends StatelessWidget {
  ProductGrid({
    super.key,
    required this.controller,
    required this.cartController,
    required this.isReverse,
  });

  final CartController cartController;
  var controller;
  var isReverse;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      reverse: isReverse,
      shrinkWrap: true,
      physics: isReverse ? const NeverScrollableScrollPhysics() : null,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.6,
        crossAxisCount: 2,
        crossAxisSpacing: 8.0, // Khoảng cách giữa các cột
        mainAxisSpacing: 8.0, // Khoảng cách giữa các hàng
      ),
      itemCount: isReverse ? 16 : controller.products.length,
      itemBuilder: (context, index) {
        final product = controller.products[index];
        return Card(
          elevation: 3,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.DETAIL_PAGE, arguments: product);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white, // Màu và độ trong suốt của shadow
                    spreadRadius: 30, // Bề rộng của shadow
                    blurRadius: 30, // Độ mờ của shadow
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    '${BaseConfig.BASE_URL_E}/${product.images[0].imageUrl}',
                    fit: BoxFit.cover,
                    height: 136, // Chiều cao của ảnh
                    width: double.infinity, // Rộng ảnh sẽ fill toàn bộ Card
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 16,
                      bottom: 10,
                      right: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: MyDefinition.SUB_FONT_SIZE + 1,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          '${Helper().formatNumber(product.price)} vnđ',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: MyDefinition.PRIMARY_FONT_SIZE),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        cartController
                            .addToCart(CartItem(product: product, quantity: 1));
                        Get.snackbar(
                            'Giỏ hàng', 'Đã thêm sản phẩm vào giỏ hàng!');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyDefinition.PRIMARY_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        'Thêm vào giỏ',
                        style: TextStyle(
                          color: MyDefinition.TEXT_BUTTON_COLOR,
                          fontSize: MyDefinition.PRIMARY_FONT_SIZE - 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
