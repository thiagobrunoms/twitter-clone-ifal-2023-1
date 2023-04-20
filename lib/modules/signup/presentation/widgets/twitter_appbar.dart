import 'package:flutter/material.dart';

import '../../../../shared/ui/widgets/bird_icon_widget.dart';

class TwitterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TwitterAppBar({super.key, this.leading, this.bottom});

  final Widget? leading;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const BirdIconWidget(),
      centerTitle: true,
      leading: leading,
      iconTheme: const IconThemeData(color: Colors.black),
      bottom: bottom,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(100);
}