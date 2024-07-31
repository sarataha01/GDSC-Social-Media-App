import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../models/post_model.dart';
import 'post_content.dart';
import 'post_interactions.dart';
import 'user_post_info.dart';

class PostContainer extends StatelessWidget {
  final PostModel post;
  const PostContainer({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorApp.mainApp,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            UserPostInfo(post: post),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PostContent(post: post),
            ),
            const SizedBox(
              height: 16,
            ),
            PostInteractions(post: post),
          ],
        ),
      ),
    );
  }
}
