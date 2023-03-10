import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/shared/ui/widgets/twitter_text_field/text_field.dart';

import '../../widgets/twitter_appbar.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TwitterAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create your account', 
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
              TwitterTextField(hint: 'Name', validate: (name) {
                print('validando nome: ${name.length > 5}');
                if (name.length > 5) {
                  return true;
                }

                return false;
              },),
              // TwitterTextField(hint: 'Phone number or email address'),
              // TwitterTextField(hint: 'Date of birth'),
            ],
          ),
        )
      )
    );
  }
}