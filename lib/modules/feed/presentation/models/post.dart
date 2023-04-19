import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Post({
    required this.id, 
    required this.user, 
    required this.account, 
    required this.userProfile,
    required this.title,
    required this.body,
    this.media,
    required this.date,
    this.likes = 0,
    this.shares = 0,
    this.statistics = 0,
    this.comments = 0,
    this.reposts = 0,
  });

  final String id;
  final String user;
  final String account;
  final String userProfile;
  final String title;
  final String body;
  final String? media; //URL
  final DateTime date;
  final int likes;
  final int comments;
  final int shares;
  final int statistics;
  final int reposts;


  factory Post.fromMap(Map<String, dynamic> map) {
    DateTime? dateTime;
    if (map['post_date'] != null) {
      dateTime =(map['post_date'] as Timestamp).toDate();
    }

    return Post(
      id: map['id'].toString(),
      body: map['body'],
      user: map['user'],
      userProfile: map['user_profile'],
      account: map['account'],
      title: map['title'],
      date: dateTime ?? DateTime.now(),
      media: map['media'],
      shares: map['shares'],
      likes: map['likes'],
      comments: map['comments'],
      statistics: map['statistics'],
      reposts: map['reposts'],
      
    );
  }

}
