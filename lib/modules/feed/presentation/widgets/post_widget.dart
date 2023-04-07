import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/models/post.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/post_content.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/user_avatar.dart';

class PostWidget extends StatefulWidget {
  // final Post post;
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {

  late Post postExample;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          UserAvatar(imageURL: 'https://buffer.com/library/content/images/2020/05/Ash-Read.png'),
          Expanded(child: PostContent()),
        ],
      ),
    );
  }
}