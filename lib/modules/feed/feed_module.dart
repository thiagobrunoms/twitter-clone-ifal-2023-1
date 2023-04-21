import 'package:flutter_modular/flutter_modular.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/data/feed_firebase_datasource.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/feed_controller.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/feed_page.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/pages/feeds.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/pages/happening_now.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/pages/twitter_search.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/widgets/create_post_widget/create_post_controller.dart';

import '../core/network/network_module.dart';
import 'data/feed_rest_datasource.dart';

const String toFeeds = '/feeds';
const String toTwitterSearch = '/twitter_search';
const String toHappeningNow = '/happening_now';

class FeedModule extends Module {
  List<Bind> get binds => [
    Bind.singleton((i) => FeedFirebaseDatasource()),
    Bind.singleton((i) => FeedPageController(feedDatasource: i.get())),
    Bind.singleton((i) => CreatePostController(feedDatasource: i.get())),
  ];

  @override
  List<Module> get imports => [
    NetworkModule(),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) =>  const FeedPage(), children: [
      ChildRoute(toFeeds, child: (context, args) =>  const Feeds()),
      ChildRoute(toTwitterSearch, child: (context, args) =>  const TwitterSearch()),
      ChildRoute(toHappeningNow, child: (context, args) =>  const HappeningNow())
    ] ),
  ];
}