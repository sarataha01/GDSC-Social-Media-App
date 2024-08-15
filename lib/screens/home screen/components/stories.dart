import 'package:flutter/material.dart';

import '../../../core/utils/get_avatar.dart';

class MyStories extends StatelessWidget {
  const MyStories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i <= 20; i++) ...[
            const SizedBox(
              width: 17,
            ),
            CircleAvatar(
              radius: 36.5,
              backgroundImage: NetworkImage(GeneralUtils.getUniqueAvatar()),
            ),
          ]
        ],
      ),
    );
  }
}
