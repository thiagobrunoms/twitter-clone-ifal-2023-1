import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/models/post.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/create_post_widget/create_post_widget.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/post_widget.dart';

import '../../../signup/presentation/widgets/twitter_appbar.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/feed_controller.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> with SingleTickerProviderStateMixin {
  late FeedPageController controller;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    controller = Modular.get<FeedPageController>();
    controller.fetchFeed();

    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: _buildDrawer(),
      appBar: TwitterAppBar(
        leading: InkWell(
          onTap: () {
            scaffoldKey.currentState!.openDrawer();
          },
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://buffer.com/library/content/images/2020/05/Ash-Read.png'),
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          tabs: const [
            Tab(text: 'For you'),
            Tab(text: 'Following'),
          ]),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: _listenToPosts()
            ),
            Text('OUTRO FEED')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context, 
            isScrollControlled: true,
            builder: (context) {
              return const CreatePostWidget();
            }
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 8.0),
          child: Column(
            children: const [
              Text('Thiago'),
              ExpansionTile(
                title: Text('Professional Tools'),
                children: [
                  Text('UFAL'),
                  Text('IFAL'),
                ],
              )

            ],
          ),
        ),
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