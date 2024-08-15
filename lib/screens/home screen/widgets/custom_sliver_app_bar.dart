import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/components/app_name.dart';
import '../../../core/constants/asset_data.dart';
import '../../../core/constants/clipping/curved_background.dart';
import '../components/appbar_actions.dart';

class MySliverAppBar extends StatelessWidget {
  final bool? actions;
  final double expandedheight;
  final Widget? widget;
  final List<Widget>? overlayWidgets;

  const MySliverAppBar({
    super.key,
    this.widget,
    required this.expandedheight,
    this.overlayWidgets,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      clipBehavior: Clip.none,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          clipBehavior: Clip.none,
          children: [
            CurvedBackground(
              child: Column(
                children: [
                  AppBar(
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
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: expandedheight / 2,
                    ),
                    child: widget != null ? widget! : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            if (overlayWidgets != null) ...overlayWidgets!,
          ],
        ),
      ),
      expandedHeight: expandedheight,
      floating: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    );
  }
}
