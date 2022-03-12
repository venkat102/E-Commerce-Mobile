import 'dart:async';
// import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecom/utils/app_color.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/widgets/small_text.dart';
import 'package:ecom/widgets/title_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/card_content.dart';

class HomeSlider extends StatefulWidget {
  int totalPage;
  HomeSlider({Key? key, required this.totalPage}) : super(key: key);
  @override
  State<HomeSlider> createState() => _HomeSliderState(totalPage: totalPage);
}

class _HomeSliderState extends State<HomeSlider> {
  int totalPage;
  int _currentpage = 0;
  double _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  bool increment = true;
  // int indicatorLimit = 5;
  // double indicatorPosition = 0;

  _HomeSliderState({required this.totalPage});

  final PageController _pageViewController =
      PageController(initialPage: 0, viewportFraction: 0.85);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentpage + 1 >= totalPage) {
        increment = false;
      } else if (_currentpage - 1 < 0) {
        increment = true;
      }
      _currentpage =
          (increment ? _currentpage + 1 : _currentpage - 1) % totalPage;

      _pageViewController.animateToPage(_currentpage,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeOutBack);
    });

    _pageViewController.addListener(() {
      setState(() {
        _currentPageValue = _pageViewController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  _onPageChange(int index) {
    setState(() {
      _currentpage = index;
      // indicatorPosition = (index % indicatorLimit).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: AppColors.orange,
          height: Dimensions.sliderView,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageViewController,
              onPageChanged: _onPageChange,
              itemCount: totalPage,
              itemBuilder: (context, index) {
                return _buildPageItem(index);
              }),
        ),
        // DotsIndicator(
        //   dotsCount: indicatorLimit,
        //   position: indicatorPosition,
        //   decorator: DotsDecorator(
        //     size: Size.square(Dimensions.width9),
        //     activeSize: Size(Dimensions.width18, Dimensions.height9),
        //     activeShape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(Dimensions.radius5)),
        //   ),
        // ),
        // SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20),
          child: Row(
            children: [
              TitleText(text: "Sub Title"),
            ],
          ),
        ),
        //List View
        Container(
          height: 800,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: totalPage,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height10),
                  child: Row(
                    children: [
                      Container(
                        height: Dimensions.listViewImgSize,
                        width: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.orange,
                            image: const DecorationImage(
                                image:
                                    NetworkImage('https://picsum.photos/200'),
                                fit: BoxFit.cover)),
                      ),
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewTextCon,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.lightGrey,
                                  spreadRadius: 1,
                                  blurRadius: Dimensions.radius5,
                                  offset: Offset(Dimensions.height5,
                                      0), // changes position of shadow
                                ),
                                BoxShadow(
                                  color: AppColors.white,
                                  offset: Offset(0, -Dimensions.width5),
                                ),
                                BoxShadow(
                                  color: AppColors.white,
                                  offset: Offset(0, Dimensions.width5),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.radius20),
                                  bottomRight:
                                      Radius.circular(Dimensions.radius20)),
                              color: AppColors.white),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: Dimensions.height10,
                                  left: Dimensions.width10,
                                  right: Dimensions.width10),
                              child: cardContent(
                                  title: "Title",
                                  rating: 5,
                                  comment: 5445,
                                  description: "Description")),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _buildPageItem(index) {
    double height = Dimensions.sliderViewContainer;

    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      double currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      double currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      double currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      double currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1.0);
      matrix = Matrix4.diagonal3Values(1, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      double currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);

      double currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1.0);
      matrix = Matrix4.diagonal3Values(1, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      double currScale = 0.8;

      matrix = Matrix4.diagonal3Values(1, currScale, 1.0)
        ..setTranslationRaw(0, height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: height,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.yellow,
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/200'),
                  fit: BoxFit.cover,
                )),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.sliderViewTextContainer,
                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightGrey,
                        spreadRadius: 1,
                        blurRadius: Dimensions.radius5,
                        offset: Offset(0,
                            Dimensions.height5), // changes position of shadow
                      ),
                      BoxShadow(
                        color: AppColors.white,
                        offset: Offset(-Dimensions.width5, 0),
                      ),
                      BoxShadow(
                        color: AppColors.white,
                        offset: Offset(Dimensions.width5, 0),
                      )
                    ]),
                padding: EdgeInsets.only(
                    left: Dimensions.width15,
                    right: Dimensions.width15,
                    top: Dimensions.height15),
                child: cardContent(
                    title: "Title",
                    rating: 5,
                    comment: 5445,
                    description: "Description"),
              ))
        ],
      ),
    );
  }
}
