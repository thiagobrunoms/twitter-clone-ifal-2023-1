import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/helpers/validators.dart';
import 'package:twitter_clone_ifal_2023/shared/ui/widgets/twitter_button.dart';
import 'package:twitter_clone_ifal_2023/shared/ui/widgets/twitter_text_field/text_field.dart';

import '../../../../../shared/ui/widgets/twitter_text_field/twitter_text_field_controller.dart';
import '../../widgets/twitter_appbar.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TwitterTextFieldController nameController = TwitterTextFieldController();
  TwitterTextFieldController emailController = TwitterTextFieldController();

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
              TwitterTextField(
                hint: 'Name', 
                validate: CreateAccountValidators.validateName,
                errorMessage: 'Nome inválido! Deve ter pelo menos 5 caracteres',
                controller: nameController
              ),
              TwitterTextField(
                hint: 'Email address',
                validate: CreateAccountValidators.validateEmail,
                errorMessage: 'Email inválido!',
                controller: emailController
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (context) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: TwitterButton(
                      width: 110.0,
                      height: 40.0,
                      onPressed: nameController.isValid && emailController.isValid ? confirm : null,
                      child: const Text('Avançar'),
                    ),
                  );
                }
              )
              
              // TwitterTextField(
              //   hint: 'Date of birth',
              //   validate: CreateAccountValidators.validateBith,
              //   errorMessage: 'Nome inválido! Deve ter pelo menos 5 caracteres',
              // ),
            ],
          ),
        )
      )
    );
  }

  void confirm() {
    print('Continuando para próxima tela!');
  }
}