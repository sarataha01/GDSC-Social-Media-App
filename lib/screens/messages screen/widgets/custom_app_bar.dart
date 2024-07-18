import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/asset_data.dart';
import '../../../constants/clipping/curved_background.dart';
import '../../home screen/components/appbar_actions.dart';
import '../../login screen/components/app_name.dart';

class MyAppBar extends StatelessWidget {
  final Widget? leading;
  final bool? actions;
  final Widget? widget;
  final List<Widget>? overlayWidgets;
  const MyAppBar(
      {super.key,
      this.actions,
      this.widget,
      this.overlayWidgets,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return CurvedBackground(
      child: Column(
        children: [
          AppBar(
            leading: leading,
            title: AppName(
              width: 50,
              height: 30,
              fontSize: 30,
              mainAxisAlignment: MainAxisAlignment.start,
              svgPicture: SvgPicture.asset(
                AssetData.logo2Path,
                width: 20,
                height: 20,
              ),
              sizedBox: 6,
            ),
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            actions: actions == true
                ? const [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: AppbarActions(),
                    )
                  ]
                : null,
          ),
          const SizedBox(
            height: 10,
          ),
          widget != null ? widget! : const SizedBox.shrink(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
