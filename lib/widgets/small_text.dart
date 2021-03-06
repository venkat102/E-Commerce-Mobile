import 'package:ecom/utils/dimensions.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overFlow;
  SmallText(
      {Key? key,
      this.color = const Color(0xFFBDBDBD),
      required this.text,
      this.size = 0,
      this.height = 1.2,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          height: height,
          fontSize: size == 0 ? Dimensions.smallFont : size),
    );
  }
}
