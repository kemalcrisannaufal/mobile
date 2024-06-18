import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maenbal/app/data/models/fixtures_model.dart';
import 'package:maenbal/app/data/models/news_model.dart';
import 'package:maenbal/app/data/url_api.dart';
import 'package:maenbal/app/modules/home/providers/match_provider.dart';
import 'package:maenbal/app/modules/home/providers/news_provider.dart';

class HomeController extends GetxController {
  var fixtures = List<Fixture>.empty().obs;
  var news = List<News>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchFixtures();
    fetchNews();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchFixtures() {
    MatchProvider().getFixtures().then((value) {
      for (var data in value) {
        DateTime dateTime = DateTime.parse(data["kickoff"]);
        String timeString = "${DateFormat('HH:mm').format(dateTime)} AM";
        Fixture fixture = Fixture(
          id: data['id'],
          type: data['type'],
          location: data['location'],
          kickoff: timeString,
          homeName: data['home_team']["name"],
          awayName: data['away_team']["name"],
          homeInit: data['home_team']["initial"],
          awayInit: data['away_team']["initial"],
          // ignore: prefer_interpolation_to_compose_strings
          homeLogo: UrlApi.url + "/storage/logo/" + data['home_team']["logo"],
          // ignore: prefer_interpolation_to_compose_strings
          awayLogo: UrlApi.url + "/storage/logo/" + data['away_team']["logo"],
        );
        fixtures.add(fixture);
      }
    });
  }

  void fetchNews() {
    NewsProvider().getNews().then((value) {
      for (var data in value) {
        News news = News(
          id: data['id'],
          title: data['title'],
          // ignore: prefer_interpolation_to_compose_strings
          thumbnail: UrlApi.url + "/storage/thumbnails/" + data['thumbnail'],
          updatedAt: data['updated_at'],
          content: data['content'],
        );
        this.news.add(news);
      }
    });
  }
}
