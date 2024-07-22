import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/asset_data.dart';
import '../../constants/colors.dart';
import '../login screen/components/divider.dart';
import '../shared components/app_name.dart';
import 'components/other_signup_options.dart';
import 'components/signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.mainApp,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                AppName(
                  width: 66,
                  height: 63,
                  fontSize: 60,
                  mainAxisAlignment: MainAxisAlignment.center,
                  svgPicture: SvgPicture.asset(
                    AssetData.logoPath,
                    width: 60,
                    height: 60,
                  ),
                  sizedBox: 15,
                ),
                const SignupForm(),
                const SizedBox(
                  height: 16,
                ),
                const MyDivider(),
                const SizedBox(
                  height: 16,
                ),
                const SignupOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
