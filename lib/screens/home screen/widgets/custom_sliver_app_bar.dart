import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/constants/colors.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const MySliverAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: title,
      backgroundColor: ColorApp.mainApp,
      actions: actions,
      leading: leading,
      bottom: bottom,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(155),
          bottomRight: Radius.circular(155),
        ),
      ),
      floating: true,
      pinned: true,
      snap: true,
      expandedHeight: 160.0,
    );
  }
}
