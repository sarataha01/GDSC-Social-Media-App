import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/screens/shared%20components/back_button.dart';
import 'package:gdsc_social_media_app/screens/shared%20widgets/custom_app_bar.dart';

import '../../models/post_model.dart';
import '../home screen/components/post components/post_container.dart';

class OpenedPost extends StatelessWidget {
  const OpenedPost({super.key});

  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)?.settings.arguments as PostModel;
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            leading: const CustomBackButton(),
            widget: Hero(
              tag: 'Selected ${post.postId}',
              child: Material(
                type: MaterialType.transparency,
                child: PostContainer(post: post),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
