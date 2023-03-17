import 'friend.dart';

abstract class SignUpRepository {
  Future<List<Friend>> loadSuggestionsFriends();
}


//INTERFACE SEGRAGATE
abstract class FriendRepository {
  //load friend suggestion
}