

import 'package:twitter_clone_ifal_2023/modules/signup/domain/entities/friend.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/domain/repositories/friends_repository.dart';

import '../datasources/load_friends_suggestions_datasource.dart';

class FriendsRepositoryImpl implements FriendRepository {
  FriendsRepositoryImpl({required this.datasource});

  LoadFriendSuggestionsDatasource datasource;

  @override
  Future<List<Friend>> loadSuggestionsFriends() async {
    return await datasource.loadFriendSuggestions();
  }

  
}