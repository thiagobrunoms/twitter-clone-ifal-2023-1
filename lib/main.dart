import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:twitter_clone_ifal_2023/modules/app_module.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/pages/signup_init_page.dart';

import 'modules/signup/presentation/pages/choose_language/choose_language_page.dart';
import 'modules/signup/presentation/pages/create_account/create_account_page.dart';
import 'modules/signup/presentation/pages/friend_suggestions/friend_suggestions_page.dart';
import 'modules/signup/presentation/pages/themes_list/themes_list_page.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Twitter Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
