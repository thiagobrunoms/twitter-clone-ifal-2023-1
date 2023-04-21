import 'package:flutter/material.dart';

class TwitterSearch extends StatefulWidget {
  const TwitterSearch({super.key});

  @override
  State<TwitterSearch> createState() => _TwitterSearchState();
}

class _TwitterSearchState extends State<TwitterSearch> {
  @override
  Widget build(BuildContext context) {
    return const Text('Twitter search');
  }
}