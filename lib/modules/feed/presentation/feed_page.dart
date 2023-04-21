import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/feed_module.dart';
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
      body: const SafeArea(
        child: RouterOutlet(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          switch (index) {
            case 0:
              Modular.to.navigate(toFeeds);
              break;
            case 1: 
              Modular.to.navigate(toTwitterSearch);
              break;
            case 2:
              Modular.to.navigate(toHappeningNow);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_on),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: ''
          ),
        ]
      ),
    );
  }
}