import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  const MyCustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: Colors.transparent);
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
