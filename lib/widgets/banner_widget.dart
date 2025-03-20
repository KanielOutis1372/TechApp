import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/client/home_controller.dart';

class BannerWidget extends GetView<HomeController> {
  const BannerWidget({
    super.key,
    // required this.controller,
  });

  // final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 3,
            blurRadius: 30,
            offset: const Offset(0, 10), // Di chuyển shadow xuống dưới
          ),
        ],
      ),
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Obx(
            () => PageView.builder(
              itemCount: controller.banners.length,
              controller: controller.pageController,
              onPageChanged: (value) => controller.currentPage.value = value,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      controller.banners[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
