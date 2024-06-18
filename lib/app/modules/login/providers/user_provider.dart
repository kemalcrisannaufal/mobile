import 'package:get/get.dart';
import 'package:maenbal/app/data/url_api.dart';

class UserProvider extends GetConnect {
  Future<dynamic> login(String email, String password) async {
    final url = "${UrlApi.url}/api/login";

    final response = await post(url, {
      'email': email,
      'password': password,
    });
    return response.body;
  }
}
