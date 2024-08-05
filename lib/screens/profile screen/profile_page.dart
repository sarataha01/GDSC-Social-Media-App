import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/constants/colors.dart';
import 'package:gdsc_social_media_app/screens/shared%20components/back_button.dart';
import 'package:gdsc_social_media_app/screens/shared%20widgets/custom_app_bar.dart';
import 'package:gdsc_social_media_app/util/get_avatar.dart';

import '../../models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const MyAppBar(
              leading: CustomBackButton(),
            ),
            CircleAvatar(
              radius: 60,
              child: Image.network(GeneralUtils.getUniqueAvatar()),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Name: ${user.name}'),
            Text('Username: ${user.username}'),
            Text('Email: ${user.email}'),
            const SizedBox(
              height: 20,
            ),
            const IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [Text('50'), Text('followers')],
                  ),
                  SizedBox(width: 20),
                  VerticalDivider(
                    thickness: 1,
                    color: ColorApp.secondaryText,
                    endIndent: 0,
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [Text('50'), Text('following')],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
