import 'package:flutter/material.dart';

class SocialSignInButton extends StatelessWidget {
  final String logo;
  final String socialName;
  final VoidCallback callback;
  const SocialSignInButton({super.key, required this.logo, required this.socialName, required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(60)
          )
        ),
        onPressed: callback,
        child: Padding(
          padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logo, width: 40, height: 40,),
              SizedBox(width: 10,),
              Text('Continue with $socialName', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
            ],
          ),
        )
      ),
    );
  }
}