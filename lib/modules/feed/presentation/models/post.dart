class Post {
  final String id;
  final String userId;
  final String title;
  final String body;
  final String? media;
  final DateTime date;

  Post({
    required this.id, 
    required this.userId, 
    required this.title,
    required this.body,
    this.media,
    required this.date,
  });

}
