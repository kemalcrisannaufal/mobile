import 'package:get/get.dart';
import 'package:maenbal/app/modules/login/providers/user_provider.dart';
import 'package:maenbal/app/routes/app_pages.dart';

class LoginController extends GetxController {
  var name = "".obs;
  var email = "".obs;

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

  void login(String email, String password) {
    UserProvider().login(email, password).then((value) {
      if (value['message'] == "Success") {
        name.value = value["user"]["name"];
        this.email.value = value["user"]["email"];
        Get.offAllNamed(Routes.MAIN);
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            message: "Login Failed",
          ),
        );
      }
    });
  }
}
