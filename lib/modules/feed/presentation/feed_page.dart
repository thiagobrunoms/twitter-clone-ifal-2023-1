import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/post_widget.dart';

import '../../signup/presentation/widgets/twitter_appbar.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TwitterAppBar(
        leading: Container(
          height: 4,
          width: 4,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage('https://buffer.com/library/content/images/2020/05/Ash-Read.png'),
              fit: BoxFit.cover              
            )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            PostWidget()
          ],
        )
      ),
    );
  }
}