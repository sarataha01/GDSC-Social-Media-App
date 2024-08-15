import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/core/components/back_button.dart';
import 'package:gdsc_social_media_app/core/widgets/custom_app_bar.dart';

import '../../models/post_model.dart';
import '../home screen/components/post components/post_container.dart';

class OpenedPost extends StatelessWidget {
  const OpenedPost({super.key});

  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)?.settings.arguments as PostModel;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              leading: const CustomBackButton(),
              widget: Hero(
                tag: 'Selected ${post.postId}',
                child: Material(
                  type: MaterialType.transparency,
                  child: PostContainer(post: post),
                ),
              ),
            ),
            // ListView(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   children: [
            //     ListTile(
            //       leading: CircleAvatar(
            //         child: Image.network(GeneralUtils.getUniqueAvatar()),
            //       ),
            //       title: Text('Name'),
            //       subtitle: Text('el comment'),
            //       trailing: Icon(Icons.delete_rounded),
            //     ),
            //     ListTile(
            //       leading: CircleAvatar(
            //         child: Image.network(GeneralUtils.getUniqueAvatar()),
            //       ),
            //       title: Text('Name'),
            //       subtitle: Text('el comment'),
            //       trailing: Icon(Icons.delete_rounded),
            //     ),
            //     ListTile(
            //       leading: CircleAvatar(
            //         child: Image.network(GeneralUtils.getUniqueAvatar()),
            //       ),
            //       title: Text('Name'),
            //       subtitle: Text('el comment'),
            //       trailing: Icon(Icons.delete_rounded),
            //     ),
            //     ListTile(
            //       leading: CircleAvatar(
            //         child: Image.network(GeneralUtils.getUniqueAvatar()),
            //       ),
            //       title: Text('Name'),
            //       subtitle: Text('el comment'),
            //       trailing: Icon(Icons.delete_rounded),
            //     ),
            //     ListTile(
            //       leading: CircleAvatar(
            //         child: Image.network(GeneralUtils.getUniqueAvatar()),
            //       ),
            //       title: Text('Name'),
            //       subtitle: Text('el comment'),
            //       trailing: Icon(Icons.delete_rounded),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
