import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/dimensions.dart';
import 'small_text.dart';
import 'title_text.dart';

class cardContent extends StatelessWidget {
  final String title;
  final int rating;
  final int comment;
  final String description;
  final double fontSize;
  const cardContent(
      {Key? key,
      required this.title,
      required this.rating,
      required this.comment,
      required this.description,
      this.fontSize = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TitleText(
          text: "$title",
          size: fontSize == 0 ? Dimensions.titleFont : fontSize),
      SizedBox(height: Dimensions.height10),
      Row(
        children: [
          Wrap(
              children: List.generate(
                  rating,
                  (index) => Icon(Icons.star,
                      color: AppColors.green, size: Dimensions.height15))),
          SizedBox(width: Dimensions.width5),
          SmallText(text: "$rating.0  "),
          SizedBox(width: Dimensions.width5),
          SmallText(text: "$comment Comments")
        ],
      ),
      SizedBox(height: Dimensions.height10),
      SmallText(text: "$description")
    ]);
  }
}
