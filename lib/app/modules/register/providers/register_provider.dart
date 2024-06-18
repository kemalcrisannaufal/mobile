import 'package:get/get.dart';
import 'package:maenbal/app/data/url_api.dart';

class RegisterProvider extends GetConnect {
  Future<dynamic> register(String name, String email, String password,
      String confirmationPassword) async {
    final url = "${UrlApi.url}/api/register";

    final response = await post(url, {
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': confirmationPassword
    });
    return response.body;
  }
}
