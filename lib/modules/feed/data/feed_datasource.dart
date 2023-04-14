import '../presentation/models/post.dart';

abstract class FeedDatasource {
  Future<List<Post>> loadPosts();
  Stream<List<Post>> listenPosts();
}