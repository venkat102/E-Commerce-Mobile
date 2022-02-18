import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecom/utils/app_color.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:ecom/widgets/small_text.dart';
import 'package:ecom/widgets/title_text.dart';
import 'package:flutter/material.dart';

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

  _HomeSliderState({required this.totalPage});

  final PageController _pageViewController =
      PageController(initialPage: 0, viewportFraction: 0.85);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      _currentpage = (_currentpage + 1) % totalPage;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: AppColors.orange,
          height: MediaQuery.of(context).size.height / 3,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageViewController,
              onPageChanged: _onPageChange,
              itemCount: totalPage,
              itemBuilder: (context, index) {
                return _buildPageItem(index);
              }),
        ),
        DotsIndicator(
          dotsCount: totalPage,
          position: _currentpage.toDouble(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
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

      matrix = Matrix4.diagonal3Values(1, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      double currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);

      double currTrans = height * (1 - currScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      double currTrans = height * (1 - 0.8) / 2;

      matrix = Matrix4.diagonal3Values(1, height * (1 - _scaleFactor) / 2, 1.0)
        ..setTranslationRaw(0, currTrans, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: height,
            margin: const EdgeInsets.only(left: 10, right: 10),
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
                        blurRadius: 5,
                        offset: Offset(0, 5), // changes position of shadow
                      ),
                      BoxShadow(
                        color: AppColors.white,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: AppColors.white,
                        offset: Offset(5, 0),
                      )
                    ]),
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(text: "Title"),
                      SizedBox(height: Dimensions.height10),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(Icons.star,
                                      color: AppColors.green, size: 15))),
                          const SizedBox(width: 5),
                          SmallText(text: "5.0  "),
                          const SizedBox(width: 10),
                          SmallText(text: "5445 Comments")
                        ],
                      ),
                      SizedBox(height: Dimensions.height10),
                      SmallText(text: "Description")
                    ]),
              ))
        ],
      ),
    );
  }
}
