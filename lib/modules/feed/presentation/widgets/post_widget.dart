import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/models/post.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/post_content_area.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/user_avatar.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key, required this.post});

  final Post post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(imageURL: widget.post.userProfile),
          const SizedBox(width: 10,),
          Expanded(child: PostContentArea(post: widget.post)),
        ],
      ),
    );
  }
}