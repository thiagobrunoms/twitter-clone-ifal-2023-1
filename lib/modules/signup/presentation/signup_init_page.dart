import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/widgets/social_sign_in_button.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/widgets/twitter_text_form.dart';

import '../../../shared/ui/widgets/twitter_button.dart';

class SignUpInit extends StatelessWidget {
  const SignUpInit({super.key});


  //BAD SMELL - LONG METHOD

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTwitterIcon(),
              _buildCentralMessage(),
              _buildCreateAccountMessage(),
            ],
          ),
        )
      ),
    );
  }

  Widget _buildTwitterIcon() {
    return Image.asset('assets/images/bird_icon.png', width: 50, height: 50,);
  }

  Widget _buildCentralMessage() {
    return Column(
      children: [
        const Text('See what\'s happening \n in the world right now.', style: TextStyle(fontFamily: 'Poppins'),),
        SocialSignInButton(logo: 'assets/images/google.png', socialName: 'Google', callback: () {},),
        Padding(
          padding: const  EdgeInsets.only(top: 20.0),
          child: TwitterButton(child: Text('Create Account'), callback: confirmar),
        ),
        TwitterTextForm()
      ],
    );
  }

  void confirmar() {
    print('Confirmando');
  }

  Widget _buildCreateAccountMessage() {
    return RichText(text: TextSpan(
      text: 'Have an account already?',
      style: TextStyle(color: Colors.grey[600]),
      children: const [
        TextSpan(
          text: ' Log in',
          style: TextStyle(color: Colors.blue)
        )
      ]
    ));
  }
}