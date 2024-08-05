import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/util/get_time.dart';

import '../../../../constants/colors.dart';
import '../../../../models/post_model.dart';
import '../../../../services/post_services.dart';
import '../../../../util/get_avatar.dart';

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
        post.userUid == FirebaseAuth.instance.currentUser?.uid
            ? IconButton(
                onPressed: () async {
                  try {
                    await PostServices.deletePost(post.postId);
                    debugPrint('post id: ${post.postId}');
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Post deleted successfully.')),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.toString()}')),
                      );
                    }
                    debugPrint('Error deleting post: $e');
                  }
                },
                icon: const Icon(
                  Icons.delete_rounded,
                  color: ColorApp.important,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
