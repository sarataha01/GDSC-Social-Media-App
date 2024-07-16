import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'components/post_content.dart';
import 'components/post_interactions.dart';
import 'components/stories.dart';
import 'components/user_post_info.dart';
import 'widgets/circular_button.dart';
import 'widgets/custom_sliver_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const MySliverAppBar(
            actions: true,
            widget: MyStories(),
            expandedheight: 200,
            overlayWidgets: [
              Positioned(
                top: 173,
                left: 175,
                child: CircularButton(
                  icon: Icon(
                    Icons.add,
                    color: ColorApp.secondaryText,
                  ),
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  for (var i = 0; i <= 20; i++) ...[
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorApp.mainApp,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            UserPostInfo(),
                            Padding(
                              padding: EdgeInsets.only(left: 57.0),
                              child: PostContent(),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            PostInteractions(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
