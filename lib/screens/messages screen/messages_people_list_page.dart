import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_social_media_app/core/components/back_button.dart';

import '../../core/constants/app_styles.dart';
import '../../core/constants/asset_data.dart';
import '../../core/utils/validators.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_input_field.dart';
import 'components/chat_list.dart';
import 'components/voice_rooms.dart';
import 'widgets/screen_title.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final TextEditingController searchCTRL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            leading: const CustomBackButton(),
            widget: Padding(
              padding: const EdgeInsets.only(left: 27.0),
              child: ScreenTitle(
                title: const Text('Chat', style: AppStyles.bigTitleBold),
                subtitle: const Text('☺ 2 new messages',
                    style: AppStyles.small2TitleBold),
                svgPicture: SvgPicture.asset(AssetData.messagePath),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21.0, right: 31.0),
            child: InputField(
              controller: searchCTRL,
              prefix: const Icon(Icons.search_rounded),
              hintText: 'Search for a user',
              validator: (String? input) =>
                  Validators.checkLengthValidator(input, 7),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const ChatList(),
          const VoiceRooms(),
        ],
      ),
    );
  }
}
