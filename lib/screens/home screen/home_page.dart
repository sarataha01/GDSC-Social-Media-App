import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_social_media_app/screens/login%20screen/components/app_name.dart';

import '../../constants/asset_data.dart';
import 'components/appbar_actions.dart';
import 'widgets/custom_sliver_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          MySliverAppBar(
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
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: AppbarActions(),
              )
            ],
            // bottom: const PreferredSize(
            //   preferredSize: Size.fromHeight(100),
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: [
            //         for (var i = 0; i <= 10; i++)
            //           Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //             child: CircleAvatar(
            //               radius: 20.0,
            //               child: Text('$i'),
            //             ),
            //           ),
            //       ],
            //     ),
            //   ),
          ),
        ],
      ),
    );
  }
}
