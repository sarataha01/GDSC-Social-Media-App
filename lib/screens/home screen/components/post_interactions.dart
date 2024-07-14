import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class PostInteractions extends StatelessWidget {
  const PostInteractions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: ColorApp.secondButtonColor,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_rounded)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.chat_bubble)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
              ],
            ),
          ),
        ),
        const Spacer(),
        const Icon(Icons.bookmark_rounded),
      ],
    );
  }
}
