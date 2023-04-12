import 'package:mobx/mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/data/feed_datasource.dart';

import 'models/post.dart';
part 'feed_controller.g.dart';

class FeedPageController = _FeedPageControllerBase with _$FeedPageController;

abstract class _FeedPageControllerBase with Store {

  _FeedPageControllerBase({required this.feedDatasource});
  FeedDatasource feedDatasource;

  @observable
  ObservableFuture<List<Post>>? postsFuture;

  @observable
  ObservableList<Post>? observablePostsList = ObservableList.of([]);

  Future<void> fetchFeed() async {
    postsFuture = ObservableFuture(feedDatasource.loadPosts());
    List<Post> postsList = await postsFuture!;

    observablePostsList!.addAll(postsList);
  }
  
}