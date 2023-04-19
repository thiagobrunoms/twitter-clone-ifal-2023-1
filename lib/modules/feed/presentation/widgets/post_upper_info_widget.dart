import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/post.dart';

class PostUpperInfoWidget extends StatelessWidget {
  const PostUpperInfoWidget({super.key, required this.post});

  final Post post;

  final TextStyle myStyleBold = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  final TextStyle myStyleGrey = const TextStyle(fontSize: 14, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('d, MMM');
    DateTime postDate = post.date;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post.user, style: myStyleBold,),
        const Icon(Icons.check_circle, color: Colors.blue, size: 17,),
        Row(
          children: [
            Text(post.account, style: myStyleGrey,),
            Text(dateFormat.format(postDate), style: myStyleGrey),
          ],
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context, 
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)
                )
              ),
              builder: (context) {
                return BottomSheetPostMenu(post: post);
              }
            );
          },
          child: const Icon(Icons.more_vert, color: Colors.grey,),
        )
      ],
    );
  }
}

class BottomSheetPostMenu extends StatelessWidget {
  const BottomSheetPostMenu({
    super.key,
    required this.post
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MenuBottonSheetItem(
          icon: Icons.supervised_user_circle_outlined,
          title: 'Not interested in this Tweet',
        ),
        const HorizontalDivider(),
        MenuBottonSheetItem(
          icon: Icons.plus_one,
          title: 'Follow ${post.account}',
        ),
        const MenuBottonSheetItem(
          icon: Icons.task,
          title: 'Add/remove from list',
        ),
        MenuBottonSheetItem(
          icon: Icons.volume_off,
          title: 'Mute ${post.account}',
        ),
        const MenuBottonSheetItem(
          icon: Icons.volume_off,
          title: 'Something interesing here',
        ),
        const HorizontalDivider(),
        const MenuBottonSheetItem(
          icon: Icons.flag,
          title: 'Report Tweet',
        ),
      ],
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Divider(
        color: Color.fromARGB(255, 79, 77, 77),
        height: 10.0,
      ),
    );
  }
}

class MenuBottonSheetItem extends StatelessWidget {
  const MenuBottonSheetItem({
    super.key, 
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey,),
          const SizedBox(width: 20.0,),
          Text(title, style: const TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 79, 77, 77),),),
        ],
      ),
    );
  }
}

