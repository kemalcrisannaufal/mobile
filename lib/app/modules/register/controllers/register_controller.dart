import 'package:get/get.dart';
import 'package:maenbal/app/modules/register/providers/register_provider.dart';
import 'package:maenbal/app/routes/app_pages.dart';

class RegisterController extends GetxController {
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

  void register(
      String name, String email, String password, String confirmationPassword) {
    RegisterProvider()
        .register(name, email, password, confirmationPassword)
        .then((value) {
      if (value['message'] == "Success") {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            message: "Register Failed",
          ),
        );
      }
    });
  }
}
