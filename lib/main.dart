import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/home_page.dart';

void main() {
  runApp(const MyApp());
}

//É UM = HERANÇA
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter', faculty: 'IFAL 2023',),
    );
  }
}
