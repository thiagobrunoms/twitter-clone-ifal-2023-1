import 'package:flutter_modular/flutter_modular.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/data/datasources/load_friends_suggestions_datasource_impl.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/data/repositories/friends_repository.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/pages/create_account/create_account_page.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/pages/create_account/create_account_page_controller.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/pages/friend_suggestions/friend_suggestions_page_controller.dart';

import '../core/network/network_module.dart';
import 'presentation/pages/choose_language/choose_language_page.dart';
import 'presentation/pages/choose_language/choose_language_page_controller.dart';
import 'presentation/pages/friend_suggestions/friend_suggestions_page.dart';
import 'presentation/pages/themes_list/themes_list_page.dart';
import 'presentation/pages/signup_init_page.dart';

// LoadFriendSuggestionsDatasourceImpl datasource = LoadFriendSuggestionsDatasourceImpl(dio: Dio());
//     FriendRepository repository = FriendsRepositoryImpl(datasource: datasource);

class SignUpModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => LoadFriendSuggestionsDatasourceImpl(dio: i.get())),
    Bind.singleton((i) => FriendsRepositoryImpl(datasource: i.get())),
    Bind.singleton((i) => FriendSuggestionsPageController(repository: i.get())),
    Bind.singleton((i) => ChooseLanguagePageController()),
    Bind.singleton((i) => CreateAccountPageController()),

  ];

  @override
  List<Module> get imports => [
    NetworkModule(),
  ];
  
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SignUpInit()),
    ChildRoute('/create_account', child: (context, args) => const CreateAccountPage()),
    ChildRoute('/choose_language', child: (context, args) => const ChooseLanguagePage()),
    ChildRoute('/friend_suggestions', child: (context, args) => const FriendSuggestionsPage()),
    ChildRoute('/choose_themes', child: (context, args) => const ThemeListPage()),
  ];
}