import 'package:twitter_clone_ifal_2023/modules/signup/domain/user.dart';

abstract class FriendRepository {
  Future<List<User>> loadSuggestionsFriends();
}