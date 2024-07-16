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
                const Text(
                  '1.2k',
                  style: TextStyle(color: ColorApp.textField),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat_bubble,
                    color: ColorApp.mainText,
                  ),
                  padding: EdgeInsets.zero,
                ),
                const Text(
                  '572',
                  style: TextStyle(color: ColorApp.textField),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: ColorApp.mainText,
                  ),
                  padding: EdgeInsets.zero,
                ),
                const Text(
                  '24',
                  style: TextStyle(color: ColorApp.textField),
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
