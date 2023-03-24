import 'package:mobx/mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/data/datasources/load_friends_suggestions_datasource_impl.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/data/repositories/friends_repository.dart';

import '../../../domain/entities/friend.dart';
import '../../../domain/repositories/friends_repository.dart';
import '../../../domain/repositories/signup_repository.dart';

part 'friend_suggestions_page_controller.g.dart';

class FriendSuggestionsPageController = _FriendSuggestionsPageControllerBase with _$FriendSuggestionsPageController;

abstract class _FriendSuggestionsPageControllerBase with Store {
  

  _FriendSuggestionsPageControllerBase();

  @observable
  ObservableFuture<List<Friend>>? observableLoadFriends;
  
  @observable
  List<Friend>? friends;

  @action
  Future<void> loadFriendSuggestions() async {
    LoadFriendSuggestionsDatasourceImpl datasource = LoadFriendSuggestionsDatasourceImpl();
    FriendRepository repository = FriendsRepositoryImpl(datasource: datasource);

    observableLoadFriends = ObservableFuture(
      repository.loadSuggestionsFriends()
    );

    friends = await observableLoadFriends!;
  }
}