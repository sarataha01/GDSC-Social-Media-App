import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/asset_data.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/custom_button.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: 'Sign in with Google',
          svgIcon: SvgPicture.asset(AssetData.googlePath),
          color: ColorApp.secondButtonColor,
          textColor: ColorApp.secondaryText,
          onPressed: () {},
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          text: 'Sign in with Apple',
          svgIcon: SvgPicture.asset(AssetData.applePath),
          color: ColorApp.secondButtonColor,
          textColor: ColorApp.secondaryText,
          onPressed: () {},
        ),
      ],
    );
  }
}
