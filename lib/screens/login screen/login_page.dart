import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_social_media_app/constants/colors.dart';

import '../../constants/asset_data.dart';
import 'components/app_name.dart';
import 'components/divider.dart';
import 'components/login_form.dart';
import 'components/other_login_options.dart';
import 'components/register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                const MyForm(),
                const SizedBox(
                  height: 16,
                ),
                const MyDivider(),
                const SizedBox(
                  height: 16,
                ),
                const LoginOptions(),
                const Register(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
