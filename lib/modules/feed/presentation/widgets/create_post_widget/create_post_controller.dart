import 'package:mobx/mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/models/create_post.dart';

import '../../../data/feed_datasource.dart';
part 'create_post_controller.g.dart';

class CreatePostController = _CreatePostControllerBase with _$CreatePostController;

abstract class _CreatePostControllerBase with Store {

  _CreatePostControllerBase({required this.feedDatasource});

  FeedDatasource feedDatasource;
  
  @observable
  String body = '';

  @observable
  ObservableFuture<bool>? sendNewPostRequest;

  @action
  void setBody(String text) => body = text;

  @observable
  bool result = false;

  @action
  Future<void> sendPost() async {
    final newPost = CreatePost(
      user: 'Usuario logado', 
      account: '@usuariologado', 
      userProfile: 'userProfile', 
      body: body, 
      date: DateTime.now()
    );

    sendNewPostRequest = ObservableFuture(feedDatasource.createPost(newPost));
    result = await sendNewPostRequest!;
  }

}