import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../shared/ui/widgets/twitter_button.dart';
import '../user_avatar.dart';
import 'create_post_controller.dart';

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({super.key});

  @override
  State<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  late CreatePostController controller;

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
      bottomNavigationBar: const WritePostBottomNavBar(),
    );
  }
}

class CreatePostTop extends StatefulWidget {
  const CreatePostTop({super.key});

  @override
  State<CreatePostTop> createState() => _CreatePostTopState();
}

class _CreatePostTopState extends State<CreatePostTop> {
  late CreatePostController controller;

  @override
  void initState() {
    controller = Modular.get<CreatePostController>();

    reaction((_) => controller.result, (p0) {
      print('result ${p0}');
    });

    super.initState();
  }

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
            controller.sendPost();
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
  late CreatePostController controller;

  @override
  void initState() {
    controller = Modular.get<CreatePostController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserAvatar(imageURL: 'https://scx1.b-cdn.net/csz/news/800a/2018/whydosomanyp.jpg'),
          const SizedBox(width: 10.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TwitterButton.visibility(
                  width: 100.0,
                  height: 30.0,
                  backColor: Colors.white,
                  child: Row(
                    children: const [
                      Text('Public', style: TextStyle(color: Colors.blue),),
                      Icon(Icons.arrow_downward)
                    ],
                  )
                ),
                TextField(
                  maxLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'What\'s happening?',
                    border: InputBorder.none,
                  ),
                  onChanged: (content) {
                    controller.setBody(content);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WritePostBottomNavBar extends StatelessWidget {
  const WritePostBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.people, color: Colors.blue,),
              SizedBox(width: 50.0,),
              Text('Everyone can replay', style: TextStyle(color: Colors.blue),)
            ],
          ),
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.photo, color: Colors.blue,),
              Icon(Icons.gif_box_outlined, color: Colors.blue,),
              Icon(Icons.bar_chart, color: Colors.blue,),
              Icon(Icons.location_pin, color: Colors.blue,),
            ],
          )
        ],
      ),
    );
  }
}