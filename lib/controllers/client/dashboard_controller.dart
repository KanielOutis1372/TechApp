import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;

  final List<bool> isFilled = [true, false, false, false].obs;

  void changePage(int index) {
    currentIndex.value = index;
    for (int i = 0; i < isFilled.length; i++) {
      isFilled[i] = (i == index);
    }
  }
}
