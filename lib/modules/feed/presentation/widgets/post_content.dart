import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/models/post.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/post_upper_info_widget.dart';

class PostContent extends StatefulWidget {
  const PostContent({super.key});

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PostUpperInfoWidget(
          post: Post(
            id: 'id', 
            userId: 'userId', 
            title: 'title', 
            body: 'body', 
            date: DateTime.now()
          ),
        ),
      ],
    );
  }
}