import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/data/feed_datasource.dart';
import 'package:twitter_clone_ifal_2023/modules/feed/presentation/models/post.dart';

import '../presentation/models/create_post.dart';

class FeedFirebaseDatasource implements FeedDatasource {
  late FirebaseFirestore _firestore;

  FeedFirebaseDatasource() {
    _firestore = FirebaseFirestore.instance;
  }

  @override
  Future<List<Post>> loadPosts() async {
    QuerySnapshot<Map<String, dynamic>> data = await _firestore.collection('posts').get();

    return data.docs.map(_generatePost).toList();
  }

  Post _generatePost(QueryDocumentSnapshot<Map<String, dynamic>> eachDocument) {
    Map<String, dynamic> data = eachDocument.data();
    data['id'] = eachDocument.id;
    return Post.fromMap(data);
  }
  
  @override
  Stream<List<Post>> listenPosts() {
    Stream<QuerySnapshot<Map<String, dynamic>>> streamData = _firestore.collection('posts').snapshots();

    return streamData.map((event) => event.docs.map(_generatePost).toList());
  }
  
  @override
  Future<void> createPost(CreatePost post) async {
    await _firestore.collection('posts').add(post.toMap());
  }
  
}