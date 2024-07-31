import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../shared widgets/circular_button.dart';
import 'components/home_drawer.dart';
import 'components/post_feed.dart';
import 'components/stories.dart';
import 'widgets/custom_sliver_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          MySliverAppBar(
            actions: true,
            widget: const MyStories(),
            expandedheight: 200,
            overlayWidgets: [
              Positioned(
                top: 173,
                left: 175,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: ColorApp.secondMainApp,
                  child: CircularButton(
                    icon: const Icon(
                      Icons.add,
                      color: ColorApp.secondaryText,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Addpost');
                      //PostServices.userPostInfo();
                    },
                  ),
                ),
              )
            ],
          ),
          const PostFeed(),
        ],
      ),
    );
  }
}
