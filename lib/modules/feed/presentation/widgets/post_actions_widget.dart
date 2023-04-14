import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/models/post.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/post_action.dart';

class PostActionsWidget extends StatefulWidget {
  const PostActionsWidget({super.key, required this.post});

  final Post post;

  @override
  State<PostActionsWidget> createState() => _PostActionsWidgetState();
}

class _PostActionsWidgetState extends State<PostActionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PostAction(
          icon: Icons.message,
          number: widget.post.comments,
          callback: () {
            print('Ação de comentar!');
          }
        ),
        PostAction(
          icon: Icons.sync,
          number: widget.post.reposts,
          callback: () {
            print('Ação de repostar!');
          }
        ),
        PostAction(
          icon: Icons.favorite_outline_sharp,
          number: widget.post.likes,
          callback: () {
            print('Ação de like!');
          }
        ),
        PostAction(
          icon: Icons.stacked_bar_chart,
          number: widget.post.statistics,
          callback: () {
            print('Ação de estatística!');
          }
        ),
        PostAction(
          icon: Icons.share_outlined,
          number: widget.post.shares,
          callback: () {
            print('Ação de compartilhar!');
          }
        ),
      ],
    );
  }
}