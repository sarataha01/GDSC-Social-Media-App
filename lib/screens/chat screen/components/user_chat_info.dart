import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_styles.dart';
import '../../../constants/asset_data.dart';
import '../../../constants/colors.dart';
import '../../../models/user_model.dart';
import '../../messages screen/widgets/screen_title.dart';
import '../../shared widgets/circular_button.dart';

class UserChatInfo extends StatelessWidget {
  const UserChatInfo({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ScreenTitle(
          title: Text(
            user.name,
            style: AppStyles.smallTitleBold,
          ),
          subtitle: Text(
            '@${user.username}',
            style: AppStyles.subTitle,
          ),
          extraline: const Text(
            'active ☺',
            style: AppStyles.subTitle,
          ),
          svgPicture: SvgPicture.asset(AssetData.logo2Path),
        ),
        const Spacer(),
        CircularButton(
          icon: const Icon(
            Icons.video_call_rounded,
            color: ColorApp.secondaryText,
          ),
          onPressed: () {},
        ),
        const SizedBox(
          width: 16,
        ),
        CircularButton(
          icon: const Icon(
            Icons.phone_rounded,
            color: ColorApp.secondaryText,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
