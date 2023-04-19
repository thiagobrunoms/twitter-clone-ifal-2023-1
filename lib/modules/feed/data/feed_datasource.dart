import '../presentation/models/create_post.dart';
import '../presentation/models/post.dart';

abstract class FeedDatasource {
  Future<List<Post>> loadPosts();
  Stream<List<Post>> listenPosts();
  Future<void> createPost(CreatePost post);
}