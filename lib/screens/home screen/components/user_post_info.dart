import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/util/get_time.dart';

import '../../../models/post_model.dart';
import '../../../util/get_avatar.dart';

class UserPostInfo extends StatelessWidget {
  final PostModel post;
  const UserPostInfo({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(
            GeneralUtils.getUniqueAvatar(),
          ),
        ),
        const SizedBox(
          width: 11,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.name),
            Text('@${post.userName} • ${TimeCalc.getTimeAgo(post.time)}'),
          ],
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ],
    );
  }
}
