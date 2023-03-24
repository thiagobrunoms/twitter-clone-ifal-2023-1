import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/data/datasources/signup_google_datasource.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/pages/friend_suggestions/widgets/friends_to_follow/friend_card_widget.dart';

import '../../../../../shared/ui/widgets/subtitle_widget.dart';
import '../../../../../shared/ui/widgets/title_widget.dart';
import '../../../data/datasources/load_friends_suggestions_datasource.dart';
import '../../../data/datasources/load_friends_suggestions_datasource_impl.dart';
import '../../../data/datasources/signup_rest_datasource.dart';
import '../../../data/datasources/signup_web_datasource.dart';
import '../../../data/repositories/signup_repository.dart';
import '../../../domain/entities/friend.dart';
import '../../../domain/repositories/signup_repository.dart';
import '../../widgets/twitter_appbar.dart';
import 'friend_suggestions_page_controller.dart';

class FriendSuggestionsPage extends StatefulWidget {
  const FriendSuggestionsPage({super.key});

  @override
  State<FriendSuggestionsPage> createState() => _FriendSuggestionsPageState();
}

class _FriendSuggestionsPageState extends State<FriendSuggestionsPage> {
  late FriendSuggestionsPageController controller;
  
  @override
  void initState() {
    controller = FriendSuggestionsPageController();
    controller.loadFriendSuggestions();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TwitterAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [  
                TitleWidget(title: 'Sugestões de perfis para seguir'),
                const SubtitleWidget(title: 'Ao seguir alguém você verá os twittes dessa pessoa em sua timeline na página inicial'),
                const SizedBox(height: 10),
                TitleWidget(title: 'Pessoas que talvez você conheça', size: 20),
                Observer(
                  builder: (context) {
                    if (controller.observableLoadFriends != null && 
                        controller.observableLoadFriends!.status == FutureStatus.pending && 
                        controller.friends == null) {
                      return const CircularProgressIndicator();
                    }

                    List<Friend> friendsSuggestions = controller.friends!;
                    List<Widget> friendCards = friendsSuggestions.map(_createFriendCard).toList();
                    
                    return Column(
                      children: friendCards,
                    );  
                  }
                ),  
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createFriendCard(Friend friend) {
    return FriendCard(friend: friend); //FriendCard é um widget
  }
}