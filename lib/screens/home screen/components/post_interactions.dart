import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../models/post_model.dart';

class PostInteractions extends StatelessWidget {
  final PostModel post;

  const PostInteractions({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 30,
            color: ColorApp.secondButtonColor,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_rounded,
                    color: ColorApp.mainText,
                  ),
                  padding: EdgeInsets.zero,
                ),
                Text(
                  post.likes.toString(),
                  style: const TextStyle(color: ColorApp.textField),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat_bubble,
                    color: ColorApp.mainText,
                  ),
                  padding: EdgeInsets.zero,
                ),
                Text(
                  post.comments.toString(),
                  style: const TextStyle(color: ColorApp.textField),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: ColorApp.mainText,
                  ),
                  padding: EdgeInsets.zero,
                ),
                Text(
                  post.shares.toString(),
                  style: const TextStyle(color: ColorApp.textField),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.bookmark_rounded,
          color: ColorApp.mainText,
        ),
      ],
    );
  }
}
