import 'package:flutter/material.dart';

class TwitterButton extends StatelessWidget {
  final Widget child;
  void Function()? callback; 
  
  TwitterButton({super.key, required this.child, this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60)
          )
        ),
        onPressed: callback,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: child,
        )
      ),
    );
  }
}