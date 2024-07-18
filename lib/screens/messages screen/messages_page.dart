import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_styles.dart';
import '../../constants/asset_data.dart';
import '../../util/validators.dart';
import '../login screen/widgets/custom_input_field.dart';
import 'components/chat_info.dart';
import 'components/voice_rooms.dart';
import 'widgets/custom_app_bar.dart';
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
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            widget: Padding(
              padding: const EdgeInsets.only(left: 27.0),
              child: ScreenTitle(
                title: const Text(
                  'Chat',
                  style: AppStyles.bigTitleBold,
                ),
                subtitle: const Text(
                  '☺ 2 new messages',
                  style: AppStyles.small2TitleBold,
                ),
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
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 21.0, right: 31.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/Chat');
                      },
                      child: const ChatInfo()),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
            ),
          ),
          const VoiceRooms(),
        ],
      ),
    );
  }
}
