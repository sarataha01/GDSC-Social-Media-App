import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/asset_data.dart';
import '../../../constants/clipping/curved_background.dart';
import '../../login screen/components/app_name.dart';
import '../components/appbar_actions.dart';

class MySliverAppBar extends StatelessWidget {
  final double height;
  const MySliverAppBar({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        background: CurvedBackground(
          child: Column(
            children: [
              AppBar(
                leading: const DrawerButton(),
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
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: AppbarActions(),
                  )
                ],
              ),
              SizedBox(
                height: height,
              ),
            ],
          ),
        ),
      ),
      expandedHeight: 150,
      floating: true,
      backgroundColor: Colors.transparent,
    );
  }
}
