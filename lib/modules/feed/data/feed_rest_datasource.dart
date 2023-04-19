import 'package:dio/dio.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/data/feed_datasource.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/models/post.dart';

import '../presentation/models/create_post.dart';

class FeedRestDatasource implements FeedDatasource {

  const FeedRestDatasource({required this.dio});
  final Dio dio;

  @override
  Future<List<Post>> loadPosts() async {
    final response = await dio.get('/posts');

    final dataList = response.data['posts'] as List;
    return dataList.map((eachPostMap) => Post.fromMap(eachPostMap)).toList();
  }
  
  @override
  Stream<List<Post>> listenPosts() {
    // TODO: implement listenPosts
    throw UnimplementedError();
  }
  
  @override
  Future<void> createPost(CreatePost post) {
    // TODO: implement createPost
    throw UnimplementedError();
  }
  
}

