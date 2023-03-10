import 'package:flutter/material.dart';

import '../../../../shared/ui/widgets/bird_icon_widget.dart';

class TwitterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TwitterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const BirdIconWidget(),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}