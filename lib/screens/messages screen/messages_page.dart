import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/asset_data.dart';
import '../../constants/colors.dart';
import '../../util/get_avatar.dart';
import '../../util/validators.dart';
import '../home screen/widgets/custom_sliver_app_bar.dart';
import '../login screen/widgets/custom_input_field.dart';

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
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(
            expandedheight: 185,
            widget: Padding(
              padding: const EdgeInsets.only(left: 27.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: ColorApp.buttonColor,
                    radius: 31,
                    child: SvgPicture.asset(AssetData.messagePath),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chats',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '○ 2 new messages',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 23.0, left: 31.0),
              child: Column(
                children: [
                  InputField(
                    controller: searchCTRL,
                    prefix: const Icon(Icons.search_rounded),
                    hintText: 'Search for a user',
                    validator: (String? input) =>
                        Validators.checkLengthValidator(input, 7),
                  ),
                  SizedBox(
                    height: 1000,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(
                                GeneralUtils.getUniqueAvatar(),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Annyeonghaseyo',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: ColorApp.secondaryText),
                                ),
                                Text(
                                  'ay kalam',
                                  style: TextStyle(
                                      fontSize: 10, color: ColorApp.textField),
                                ),
                                Text(
                                  'el message',
                                  style: TextStyle(
                                      fontSize: 10, color: ColorApp.textField),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 16);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
