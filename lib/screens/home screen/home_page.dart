import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'components/post_content.dart';
import 'components/post_interactions.dart';
import 'components/stories.dart';
import 'components/user_post_info.dart';
import 'widgets/custom_sliver_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const MySliverAppBar(
            stories: MyStories(),
            expandedheight: 200,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  for (var i = 0; i <= 20; i++) ...[
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
                      height: 20,
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
