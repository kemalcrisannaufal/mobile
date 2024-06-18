import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maenbal/app/common/styles/colors.dart';
import 'package:maenbal/app/common/theme/font.dart';
import 'package:maenbal/app/shared/widgets/appbar_widget.dart';
import 'package:maenbal/app/shared/widgets/matchcard_widget.dart';
import 'package:maenbal/app/shared/widgets/newsbcard_widget.dart';
import 'package:maenbal/app/shared/widgets/scoreview_widget.dart';
import 'package:maenbal/app/shared/widgets/standingscat_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorScheme.surface,
      appBar: CustomAppBar(
        title: 'LiveScore',
        isLeading: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            fit: BoxFit.fitWidth,
            'assets/images/uefa.png',
          ),
        ),
        action: [
          SvgPicture.asset(
            'assets/images/notif.svg',
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ScoreView(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Next Matches',
                    style: semiBoldText16,
                  ),
                  InkWell(
                    child: Text(
                      'See All',
                      style: mediumText12.copyWith(
                        color: const Color(0xFF54B9FC),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => controller.fixtures.isNotEmpty
                  ? MatchCard(
                      imageAClub: controller.fixtures[0].homeLogo,
                      nameAClub: controller.fixtures[0].homeInit,
                      imageBClub: controller.fixtures[0].awayLogo,
                      nameBClub: controller.fixtures[0].awayInit,
                      location: controller.fixtures[0].location,
                      time: controller.fixtures[0].kickoff,
                      isLinear: true)
                  : Center(
                      child: CircularProgressIndicator(
                        color: kColorScheme.primary,
                      ),
                    ),
            ),
            const SizedBox(height: 16),
            Obx(() => controller.fixtures.isNotEmpty
                ? MatchCard(
                    imageAClub: controller.fixtures[1].homeLogo,
                    nameAClub: controller.fixtures[1].homeInit,
                    imageBClub: controller.fixtures[1].awayLogo,
                    nameBClub: controller.fixtures[1].awayInit,
                    location: controller.fixtures[1].location,
                    time: controller.fixtures[1].kickoff,
                    isLinear: false)
                : Center(
                    child: CircularProgressIndicator(
                      color: kColorScheme.primary,
                    ),
                  )),
            const SizedBox(height: 16),
            Obx(
              () => controller.fixtures.isNotEmpty
                  ? MatchCard(
                      imageAClub: controller.fixtures[2].homeLogo,
                      nameAClub: controller.fixtures[2].homeInit,
                      imageBClub: controller.fixtures[2].awayLogo,
                      nameBClub: controller.fixtures[2].awayInit,
                      location: controller.fixtures[2].location,
                      time: controller.fixtures[2].kickoff,
                      isLinear: false)
                  : Center(
                      child: CircularProgressIndicator(
                        color: kColorScheme.primary,
                      ),
                    ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 8.0),
              child: Text(
                "Standings",
                style: semiBoldText16,
              ),
            ),
            const StandingsCat(),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 16.0, bottom: 8.0),
              child: Text(
                "Latest News",
                style: semiBoldText16,
              ),
            ),
            Obx(() => (controller.news.isNotEmpty
                ? NewsBCard()
                : Center(
                    child: CircularProgressIndicator(
                      color: kColorScheme.primary,
                    ),
                  ))),
          ],
        ),
      ),
    );
  }
}
