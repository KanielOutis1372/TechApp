import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/client/dashboard_controller.dart';
import 'package:myapp/pages/client/export_pages.dart';
import 'package:myapp/utils/my_definition.dart';

class DashBoard extends GetView<DashboardController> {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children:  [
            HomePage(),
            const FavoritePage(),
            const HistoryPage(),
            const AccountPage()
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          iconSize: MyDefinition.FONT_SIZE_ICON,
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.changePage(index),
          selectedItemColor:
              MyDefinition.SECONDARY_COLOR_2, // Màu của icon khi được chọn
          unselectedItemColor: MyDefinition
              .SECONDARY_COLOR_2, // Màu của icon khi không được chọn
          items: [
            BottomNavigationBarItem(
              icon: controller.isFilled[0]
                  ? const Icon(Icons.home_rounded)
                  : const Icon(Icons.home_outlined),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: controller.isFilled[1]
                  ? const Icon(Icons.favorite_rounded)
                  : const Icon(Icons.favorite_outline_rounded),
              label: 'Yêu thích',
            ),
            BottomNavigationBarItem(
              icon: controller.isFilled[2]
                  ? const Icon(Icons.history_rounded)
                  : const Icon(Icons.history_outlined),
              label: 'Lịch sử',
            ),
            BottomNavigationBarItem(
              icon: controller.isFilled[3]
                  ? const Icon(Icons.person_rounded)
                  : const Icon(Icons.person_outline_sharp),
              label: 'Tài khoản',
            ),
          ],
        ),
      ),
    );
  }
}
