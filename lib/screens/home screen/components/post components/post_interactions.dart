import 'package:flutter/material.dart';
import 'package:gdsc_social_media_app/screens/home%20screen/components/post%20components/interaction_count.dart';
import 'package:gdsc_social_media_app/services/post_services.dart';

import '../../../../constants/colors.dart';
import '../../../../models/post_model.dart';

class PostInteractions extends StatefulWidget {
  final PostModel post;
  final String currentUserUid;

  const PostInteractions({
    super.key,
    required this.post,
    required this.currentUserUid,
  });

  @override
  State<PostInteractions> createState() => _PostInteractionsState();
}

class _PostInteractionsState extends State<PostInteractions> {
  late bool isLiked;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.post.likedBy.contains(widget.currentUserUid);
    likeCount = widget.post.likes;
  }

  void _toggleLike() async {
    setState(() {
      if (isLiked) {
        isLiked = false;
        likeCount--;
        widget.post.likedBy.remove(widget.currentUserUid);
      } else {
        isLiked = true;
        likeCount++;
        widget.post.likedBy.add(widget.currentUserUid);
      }
    });

    try {
      await PostServices.toggleLikes(widget.post, likeCount);
    } catch (e) {
      setState(() {
        isLiked = !isLiked;
        likeCount = isLiked ? likeCount + 1 : likeCount - 1;
      });
      debugPrint('Failed to update like: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 30,
            color: ColorApp.secondButtonColor,
            child: Row(
              children: [
                InteractionCount(
                    icon: Icon(
                      Icons.favorite_rounded,
                      color: isLiked ? ColorApp.like : ColorApp.mainText,
                    ),
                    text: likeCount.toString(),
                    onPressed: _toggleLike),
                InteractionCount(
                    icon: const Icon(
                      Icons.chat_bubble,
                      color: ColorApp.mainText,
                    ),
                    text: widget.post.comments.toString(),
                    onPressed: () {}),
                InteractionCount(
                    icon: const Icon(
                      Icons.share,
                      color: ColorApp.mainText,
                    ),
                    text: widget.post.shares.toString(),
                    onPressed: () {}),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
        const Spacer(),
        const Icon(Icons.bookmark_rounded, color: ColorApp.mainText),
      ],
    );
  }
}
