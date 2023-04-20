import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/ui/widgets/twitter_button.dart';
import '../user_avatar.dart';

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({super.key});

  @override
  State<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: const [
            CreatePostTop(),
            CreatePostContent(),
          ],
        ),
      ),
      // bottomNavigationBar: Column(),
    );
  }
}

class CreatePostTop extends StatelessWidget {
  const CreatePostTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Modular.to.pop();
          }, 
          icon: const Icon(Icons.close)
        ),
        TwitterButton(
          width: 100.0,
          height: 30.0,
          onPressed: () {
            //Enviar o tweet
          },
          child: const Text('Twitter'),
        )
      ],
    );
  }
}

class CreatePostContent extends StatefulWidget {
  const CreatePostContent({super.key});

  @override
  State<CreatePostContent> createState() => _CreatePostContentState();
}

class _CreatePostContentState extends State<CreatePostContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const UserAvatar(imageURL: 'https://scx1.b-cdn.net/csz/news/800a/2018/whydosomanyp.jpg'),
        Expanded(
          child: Column(
            children: [
              TwitterButton.visibility(
                child: Row(
                  children: const [
                    Text('Public', style: TextStyle(color: Colors.blue),),
                    Icon(Icons.arrow_downward)
                  ],
                )
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'What\'s happening?'
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}