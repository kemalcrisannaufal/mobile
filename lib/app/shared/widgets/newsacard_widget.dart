import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maenbal/app/common/theme/font.dart';
import 'package:get/get.dart';
import 'package:maenbal/app/modules/home/controllers/home_controller.dart';
import 'package:intl/intl.dart';
import 'package:maenbal/app/routes/app_pages.dart';

// ignore: must_be_immutable
class NewsACard extends StatelessWidget {
  final homeC = Get.put(HomeController());

  List<dynamic> newsTitle = [];
  List<dynamic> newsPhoto = [];
  List<dynamic> newsPosted = [];
  List<dynamic> newsIdx = [];

  NewsACard() {
    newsIdx = [3, 4, 5, 6];

    newsTitle = [
      homeC.news[3].title,
      homeC.news[4].title,
      homeC.news[5].title,
      homeC.news[6].title,
    ];

    newsPhoto = [
      homeC.news[3].thumbnail,
      homeC.news[4].thumbnail,
      homeC.news[5].thumbnail,
      homeC.news[6].thumbnail,
    ];

    newsPosted = [
      formatDateString(homeC.news[0].updatedAt),
      formatDateString(homeC.news[1].updatedAt),
      formatDateString(homeC.news[2].updatedAt),
      formatDateString(homeC.news[3].updatedAt),
    ];
  }

  String formatDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat("d MMM, yyyy").format(dateTime);
  }

  final List<dynamic> newsViews = [
    " 123 k",
    " 10 k",
    " 9 k",
    " 20 k",
  ];

  final List<dynamic> newsComments = [
    " 3",
    " 20",
    " 5",
    " 35",
  ];

  final List<dynamic> newsLikes = [
    " 50",
    " 120",
    " 12",
    " 72",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(newsTitle.length, (index) {
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const NewsDetailView();
              //     },
              //     settings: RouteSettings(
              //       arguments: {
              //         'idNews': newsIdx[index],
              //         // Tambahkan data lainnya sesuai kebutuhan
              //       },
              //     ),
              //   ),
              // );
              Get.toNamed(Routes.NEWS_DETAIL, arguments: newsIdx[index]);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20.0, bottom: 16.0),
              width: 275,
              height: 345,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: 205,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(newsPhoto[index]),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Title
                          Text(
                            newsTitle[index],
                            style: semiBoldText16,
                          ),
                          // Information
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // days posted
                              Text(
                                newsPosted[index],
                                style: mediumText10.copyWith(
                                  color: const Color(0xFF8E8E8E),
                                ),
                              ),

                              // views
                              Row(
                                children: [
                                  SvgPicture.asset("assets/svg/views.svg"),
                                  Text(
                                    newsViews[index],
                                    style: mediumText10.copyWith(
                                      color: const Color(0xFF8E8E8E),
                                    ),
                                  ),
                                ],
                              ),

                              // comment
                              Row(
                                children: [
                                  SvgPicture.asset("assets/svg/comments.svg"),
                                  Text(
                                    newsComments[index],
                                    style: mediumText10.copyWith(
                                      color: const Color(0xFF8E8E8E),
                                    ),
                                  ),
                                ],
                              ),

                              // likes
                              Row(
                                children: [
                                  SvgPicture.asset("assets/svg/likes.svg"),
                                  Text(
                                    newsLikes[index],
                                    style: mediumText10.copyWith(
                                      color: const Color(0xFF8E8E8E),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
