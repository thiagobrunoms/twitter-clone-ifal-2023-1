import 'package:flutter/material.dart';

class TwitterButton extends StatelessWidget {
  final Widget child;
  void Function()? callback; 
  
  TwitterButton({super.key, required this.child, this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60)
        )
      ),
      onPressed: callback,
      child: child
    );
  }
}