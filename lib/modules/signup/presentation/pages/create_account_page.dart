import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/shared/ui/widgets/text_field.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Create your account', 
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
              TwitterTextField(hint: 'Name',),
              TwitterTextField(hint: 'Phone number or email address'),
              TwitterTextField(hint: 'Date of birth'),
            ],
          ),
        )
      )
    );
  }
}