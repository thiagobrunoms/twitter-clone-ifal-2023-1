import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.imageURL});
  
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage(imageURL),
    );
  }
}