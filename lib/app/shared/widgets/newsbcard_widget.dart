import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maenbal/app/common/theme/font.dart';
import 'package:maenbal/app/common/theme/theme.dart';
import 'package:maenbal/app/modules/home/controllers/home_controller.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class NewsBCard extends StatelessWidget {
  final homeC = Get.put(HomeController());

  String formatDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat("d MMM, yyyy").format(dateTime);
  }

  List<dynamic> newsTitle = [];
  List<dynamic> newsDate = [];
  List<dynamic> newsPhoto = [];

  NewsBCard({super.key}) {
    newsTitle = [
      homeC.news[0].title,
      homeC.news[1].title,
      homeC.news[2].title,
    ];

    newsDate = [
      formatDateString(homeC.news[0].updatedAt),
      formatDateString(homeC.news[1].updatedAt),
      formatDateString(homeC.news[2].updatedAt),
    ];

    newsPhoto = [
      homeC.news[0].thumbnail,
      homeC.news[1].thumbnail,
      homeC.news[2].thumbnail,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: List.generate(newsTitle.length, (index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(newsPhoto[index]),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsTitle[index],
                    style: boldText14.copyWith(color: themeData.highlightColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "UEFA Champions League",
                        style:
                            boldText14.copyWith(color: themeData.primaryColor),
                      ),
                      Text(
                        newsDate[index],
                        style: mediumText12.copyWith(
                            color: themeData.highlightColor),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
