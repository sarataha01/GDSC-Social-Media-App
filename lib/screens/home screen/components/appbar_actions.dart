import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AppbarActions extends StatelessWidget {
  const AppbarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: ColorApp.secondButtonColor,
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: ColorApp.secondaryText,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_rounded,
                  color: ColorApp.secondaryText,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.message_rounded,
                  color: ColorApp.secondaryText,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
