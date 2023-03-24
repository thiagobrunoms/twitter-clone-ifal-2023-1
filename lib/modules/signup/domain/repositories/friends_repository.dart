import 'package:twitter_clone_ifal_2023/modules/signup/domain/user.dart';

import '../entities/friend.dart';

abstract class FriendRepository {
  Future<List<Friend>> loadSuggestionsFriends();
}