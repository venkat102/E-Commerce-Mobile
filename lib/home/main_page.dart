import 'package:ecom/home/home_slider.dart';
import 'package:ecom/utils/app_color.dart';
import 'package:ecom/widgets/small_text.dart';
import 'package:ecom/widgets/title_text.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Container(
              margin: const EdgeInsets.only(top: 45, bottom: 10),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TitleText(
                          text: "UserName",
                          color: AppColors.paleGreen,
                          size: 20),
                      Row(
                        children: [
                          SmallText(
                            text: "Location",
                            color: AppColors.darkGrey,
                          ),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                      child: Container(
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.search,
                      color: Color(0xFF45D2A7),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: AppColors.paleGreen,
                    ),
                  ))
                ],
              )),
        ),
        HomeSlider(totalPage: 10)
      ],
    ));
  }
}
