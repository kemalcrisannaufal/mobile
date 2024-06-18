import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maenbal/app/common/styles/colors.dart';
import 'package:maenbal/app/common/theme/font.dart';
import 'package:maenbal/app/common/theme/theme.dart';
import 'package:maenbal/app/modules/home/controllers/home_controller.dart';
import 'package:maenbal/app/shared/widgets/rating_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/news_detail_controller.dart';

// ignore: must_be_immutable
class NewsDetailView extends GetView<NewsDetailController> {
  const NewsDetailView({super.key});

  String formatDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat("d MMM, yyyy").format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    var idx = Get.arguments;
    var homeC = Get.put(HomeController());
    return Scaffold(
      backgroundColor: kColorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "News Detail",
          style: semiBoldText18.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(homeC.news[idx].thumbnail),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 110),
                  padding: const EdgeInsets.only(
                      top: 90, left: 16, right: 16, bottom: 16),
                  decoration: boxDecorationWithShadow(
                    backgroundColor: kColorScheme.surface,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: regularText12,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'UEFA Champions League- ',
                              style: boldText12.copyWith(
                                color: themeData.primaryColor,
                              ),
                            ),
                            TextSpan(text: homeC.news[idx].content),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        homeC.news[idx].title,
                        style: semiBoldText12,
                      ),
                      const SizedBox(height: 50),
                      const CustomRatings(),
                      const SizedBox(height: 70),
                      Center(
                        child: Text(
                          "@2024 MadeByGroupD",
                          style: regularText14.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8, top: 65),
                      height: 110,
                      width: 370,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9E9E9).withOpacity(0.75),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          homeC.news[idx].title,
                          style: semiBoldText16,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 25,
                      child: Text(
                        formatDateString(homeC.news[idx].updatedAt),
                        style: mediumText10.copyWith(
                          color: const Color(0xFF8E8E8E),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingTop(60),
          ),
        ],
      ),
    );
  }
}
