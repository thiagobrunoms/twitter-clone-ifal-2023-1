import 'package:flutter_modular/flutter_modular.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/feed_page.dart';


class FeedModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) =>  const FeedPage() ),
  ];
}