import 'package:flutter_modular/flutter_modular.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/data/feed_firebase_datasource.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/feed_controller.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/feed_page.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/pages/feeds.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/pages/happening_now.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/pages/search_twitters.dart';

import '../core/network/network_module.dart';
import 'data/feed_rest_datasource.dart';


class FeedModule extends Module {
  List<Bind> get binds => [
    // Bind.singleton((i) => FeedRestDatasource(dio: i.get())),
    Bind.singleton((i) => FeedFirebaseDatasource()),
    Bind.singleton((i) => FeedPageController(feedDatasource: i.get())),
  ];

  @override
  List<Module> get imports => [
    NetworkModule(),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) =>  const FeedPage(), children: [
      ChildRoute('/feeds', child: (context, args) =>  const Feeds()),
      ChildRoute('/page1', child: (context, args) => const SearchTwitters()),
      ChildRoute('/page2', child: (context, args) => const HappeningNow()),
    ] ),
  ];
}