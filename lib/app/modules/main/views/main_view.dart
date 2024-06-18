import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maenbal/app/modules/highlights/views/highlights_view.dart';
import 'package:maenbal/app/modules/home/views/home_view.dart';
import 'package:maenbal/app/modules/matches/views/matches_view.dart';
import 'package:maenbal/app/modules/news/views/news_view.dart';
import 'package:maenbal/app/modules/profile/views/profile_view.dart';
import 'package:maenbal/app/shared/widgets/bottomnavbar_widget.dart';

import '../controllers/main_controller.dart';

// ignore: must_be_immutable
class MainView extends GetView<MainController> {
  var selectedIndex = 0.obs;

  MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomeView(),
                NewsView(),
                MatchesView(),
                HighlightsView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavBar(
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
          ),
        );
      },
    );
  }
}
