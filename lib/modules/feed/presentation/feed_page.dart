import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/models/post.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/post_widget.dart';

import '../../signup/presentation/widgets/twitter_appbar.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/feed_controller.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late FeedPageController controller;

  @override
  void initState() {
    controller = Modular.get<FeedPageController>();
    controller.fetchFeed();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TwitterAppBar(
      //   leading: Container(
      //     height: 4,
      //     width: 4,
      //     decoration: const BoxDecoration(
      //       shape: BoxShape.circle,
      //       image: DecorationImage(
      //         image: NetworkImage('https://buffer.com/library/content/images/2020/05/Ash-Read.png'),
      //         fit: BoxFit.cover              
      //       )
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _listenToPosts()
        ),
      ),
    );
  }

  Widget _loadPosts() {
    return Observer(
      builder: (context) {
        if (controller.postsFuture == null) {
          return const CircularProgressIndicator.adaptive();
        }

        if (controller.observablePostsList!.isEmpty) {
          return const Center(child: Text('Não há posts!'),);
        }
        
        return Column(
          children: controller.observablePostsList!.map((eachPost) => PostWidget(post: eachPost)).toList(),
        );
        
      }
    );
  }

  Widget _listenToPosts() {
    return StreamBuilder(
      stream: controller.listenToPosts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator.adaptive();
        }

        if (snapshot.data != null) {
          List<Post> posts = snapshot.data!;

          if (posts.isEmpty) {
            return const Center(child: Text('Não há posts!'),);
          }

          return Column(
            children: posts.map((eachPost) => PostWidget(post: eachPost)).toList(),
          );
        }

        return Container();
        
      },
    );
  
  }
}