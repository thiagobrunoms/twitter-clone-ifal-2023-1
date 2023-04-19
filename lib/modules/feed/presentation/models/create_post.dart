import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePost {
  CreatePost({
    required this.user, 
    required this.account, 
    required this.userProfile,
    required this.body,
    this.media,
    required this.date,
    this.likes = 0,
    this.shares = 0,
    this.statistics = 0,
    this.comments = 0,
    this.reposts = 0,
  });

  final String user;
  final String account;
  final String userProfile;
  final String body;
  final String? media; //URL
  final DateTime date;
  final int likes;
  final int comments;
  final int shares;
  final int statistics;
  final int reposts;


  Map<String, dynamic> toMap() {
    return {
      'user': 'Fake User',
      'user_profile': 'https://scx1.b-cdn.net/csz/news/800a/2018/whydosomanyp.jpg',
      'account': '@fakeaccount',
      'body': body,
      'shares': shares,
      'likes': likes,
      'comments': comments,
      'statistics': statistics,
      'reposts': reposts
    };
  }

}
