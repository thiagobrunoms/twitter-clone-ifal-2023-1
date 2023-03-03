import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/home_page.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/pages/choose_language_page.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/signup_init_page.dart';
import 'package:twitter_clone_ifal_2023/studies/streams_study.dart';

import 'modules/signup/presentation/pages/create_account_page.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const StreamStudy(), //const SignUpInit(), // const MyHomePage(title: 'Flutter', faculty: 'IFAL 2023',),
      routes: {
        '/create_account': (context) => const CreateAccountPage(),
        '/choose_language': (context) => const ChooseLanguagePage(), 
      },
      
    );
  }
}
