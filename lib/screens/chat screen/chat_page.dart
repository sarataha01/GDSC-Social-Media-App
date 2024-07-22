import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gdsc_social_media_app/constants/colors.dart';
import 'package:gdsc_social_media_app/screens/shared%20widgets/circular_button.dart';

import '../../constants/app_styles.dart';
import '../../constants/asset_data.dart';
import '../messages screen/widgets/screen_title.dart';
import '../shared widgets/custom_app_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27.0),
              child: Row(
                children: [
                  ScreenTitle(
                    title: const Text(
                      'Name naaaame',
                      style: AppStyles.smallTitleBold,
                    ),
                    subtitle: const Text(
                      '@name1234',
                      style: AppStyles.subTitle,
                    ),
                    extraline: const Text(
                      'active ☺',
                      style: AppStyles.subTitle,
                    ),
                    svgPicture: SvgPicture.asset(AssetData.logo2Path),
                  ),
                  const Spacer(),
                  const CircularButton(
                    icon: Icon(
                      Icons.video_call_rounded,
                      color: ColorApp.secondaryText,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const CircularButton(
                    icon: Icon(
                      Icons.phone_rounded,
                      color: ColorApp.secondaryText,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
