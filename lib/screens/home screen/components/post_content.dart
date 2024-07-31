import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/constants/app_styles.dart';

import '../../../models/post_model.dart';

class PostContent extends StatelessWidget {
  final PostModel post;
  const PostContent({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (post.image != null) ...[
          Image.network(
            post.image!,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const CircularProgressIndicator();
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Text('Error loading image: $error');
            },
            fit: BoxFit.contain,
          ),
        ],
        const SizedBox(
          height: 10,
        ),
        if (post.text != null) ...[
          Text(
            post.text!,
            style: AppStyles.small3TitleBold,
          ),
        ],
      ],
    );
  }
}
