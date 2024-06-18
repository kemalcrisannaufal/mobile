import 'package:get/get.dart';
import 'package:maenbal/app/data/url_api.dart';

class NewsProvider extends GetConnect {
  Future<List<dynamic>> getNews() async {
    final response = await get(UrlApi.url + "/api/news");
    return response.body["data"];
  }
}
