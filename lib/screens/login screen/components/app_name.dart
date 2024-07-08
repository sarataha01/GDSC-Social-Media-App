import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/asset_data.dart';
import '../../../constants/colors.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetData.logoPath,
          width: 66,
          height: 63,
        ),
        const SizedBox(
          width: 15,
        ),
        const Text(
          'Social',
          style: TextStyle(
            color: ColorApp.mainText,
            fontSize: 60,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
