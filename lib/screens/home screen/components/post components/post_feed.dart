import 'package:flutter/material.dart';

import '../../../../models/post_model.dart';
import '../../../../services/post_services.dart';
import 'post_container.dart';

class PostFeed extends StatelessWidget {
  const PostFeed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PostModel>>(
      stream: PostServices.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SliverFillRemaining(
            child: Center(child: Text('No posts available')),
          );
        } else {
          final posts = snapshot.data!;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final post = posts[index];
                return Column(
                  children: [
                    GestureDetector(
                      child: PostContainer(post: post),
                      onTap: () {
                        Navigator.pushNamed(context, '/Post');
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                );
              },
              childCount: posts.length,
            ),
          );
        }
      },
    );
  }
}
