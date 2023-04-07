import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/post.dart';

class PostUpperInfoWidget extends StatelessWidget {
  const PostUpperInfoWidget({super.key, required this.post});

  final Post post;

  final TextStyle myStyle = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('d, MMM');
    DateTime postDate = post.date;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('João da Silva', style: myStyle,),
        const Icon(Icons.escalator_sharp),
        const Icon(Icons.check_circle, color: Colors.blue,),
        Text('@joao', style: myStyle,),
        Text(dateFormat.format(postDate), style: myStyle),
        IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.more_vert)
        )
      ],
    );
  }
}