import 'package:flutter/material.dart';

class TwitterTextField extends StatefulWidget {
  final String hint;

  const TwitterTextField({super.key, required this.hint});

  @override
  State<TwitterTextField> createState() => _TwitterTextFieldState();
}

class _TwitterTextFieldState extends State<TwitterTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hint
      ),
      maxLength: 50,
    );
  }
}