import 'package:ecom/pages/home/home_slider.dart';
import 'package:ecom/utils/app_color.dart';
import 'package:ecom/utils/dimensions.dart';
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
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height10),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TitleText(
                          text: "UserName",
                          color: AppColors.paleGreen,
                          size: Dimensions.height20),
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
                    width: Dimensions.width40,
                    height: Dimensions.height40,
                    child: Icon(
                      Icons.search,
                      color: const Color(0xFF45D2A7),
                      size: Dimensions.iconSize24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      // color: AppColors.paleGreen,
                    ),
                  ))
                ],
              )),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: HomeSlider(),
          ),
        )
      ],
    ));
  }
}
