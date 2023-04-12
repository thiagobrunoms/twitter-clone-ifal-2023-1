import '../presentation/models/post.dart';

abstract class FeedDatasource {
  Future<List<Post>> loadPosts();
}