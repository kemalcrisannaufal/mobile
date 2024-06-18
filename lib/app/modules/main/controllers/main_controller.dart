import 'package:get/get.dart';
import 'package:maenbal/app/data/bottomnavbar_model.dart';

class MainController extends GetxController {
  final BottomNavBarModel bottomNavBarModel = BottomNavBarModel();
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
