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
  int selected = 0;

  @override
  void initState() {
    controller = Modular.get<FeedPageController>();
    controller.fetchFeed();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/feeds');
    
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });

          if (index == 0) {
            Modular.to.navigate('/feeds');
          } else if (index == 1) {
            Modular.to.navigate('/page1');
          } else if (index == 2) {
            Modular.to.navigate('/page2');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search, ), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.mic, ), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined, ), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline,), label: ''),
        ]
      ),
    );
  }

}