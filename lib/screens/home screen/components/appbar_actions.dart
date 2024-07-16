import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class AppbarActions extends StatelessWidget {
  const AppbarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: 38,
        color: ColorApp.secondButtonColor,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: ColorApp.secondaryText,
                size: 30,
              ),
              padding: EdgeInsets.zero,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_rounded,
                color: ColorApp.secondaryText,
                size: 30,
              ),
              padding: EdgeInsets.zero,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Messages');
              },
              icon: const Icon(
                Icons.message_rounded,
                color: ColorApp.secondaryText,
                size: 30,
              ),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}
