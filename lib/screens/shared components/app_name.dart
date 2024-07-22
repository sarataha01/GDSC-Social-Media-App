import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';

class AppName extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final double sizedBox;
  final MainAxisAlignment mainAxisAlignment;
  final SvgPicture svgPicture;
  const AppName(
      {super.key,
      required this.width,
      required this.height,
      required this.sizedBox,
      required this.fontSize,
      required this.mainAxisAlignment,
      required this.svgPicture});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        svgPicture,
        SizedBox(
          width: sizedBox,
        ),
        Text(
          'Social',
          style: TextStyle(
            color: ColorApp.mainText,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
