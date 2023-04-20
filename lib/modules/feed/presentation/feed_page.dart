import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/models/post.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/create_post_widget/create_post_widget.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/post_widget.dart';

import '../../signup/presentation/widgets/twitter_appbar.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/feed_controller.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> with SingleTickerProviderStateMixin {
  late FeedPageController controller;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isExpanded = false;
  late TabController _tabController;

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
      key: _scaffoldKey,
      drawer: Drawer(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Text('Thiago'),
              ExpansionTile(
                title: Text('Tile Title'),
                subtitle: Text('Sub'),
                children: [
                  Text('saLES,. BRUSADF')
                ],
              ),
              ExpansionTile(
                title: Text('Tile Title'),
                subtitle: Text('Sub'),
                children: [
                  Text('saLES,. BRUSADF')
                ],
              )
            ],
          )
        )
      ),
      appBar: TwitterAppBar(
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
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
            Tab(text: 'For you', ),
            Tab(text: 'Following',),
        ]),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(child: _listenToPosts()),
            SingleChildScrollView(child: Column(
              children: [
                Text('Outro'),
              ],
            )),
          ]
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
        print('snapshot.hasData ${snapshot.hasData}');
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