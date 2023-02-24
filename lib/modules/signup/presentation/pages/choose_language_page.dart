import 'package:flutter/material.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/widgets/custom_checkbox.dart';
import 'package:twitter_clone_ifal_2023/shared/ui/widgets/bird_icon_widget.dart';

class ChooseLanguagePage extends StatefulWidget {
  const ChooseLanguagePage({super.key});

  @override
  State<ChooseLanguagePage> createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  bool isPtBr = false;

  @override
  Widget build(BuildContext context) {
    print('RECONSTRUINDO TELA...');
    //ISOLEM OS WIDGETS:
    //1. DESEMPENHO
    //2. MANUTENÇÃO, REÚSO (SINGLE RESPONSABILITY)
    //3. GOD CLASS, LONG METHOD
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const BirdIconWidget(),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar idiomas',
                  prefixIcon: const  Icon(Icons.search, color: Colors.grey,),
                  enabledBorder: _buildBorder(),
                  focusedBorder: _buildBorder(),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 241, 245, 246)!,
                  contentPadding: const EdgeInsets.symmetric(vertical: 3),
                ),
              ),
              const CustomCheckBox(value: true, title: 'português'),
              const CustomCheckBox(value: false, title: 'espanhol'),
              const CustomCheckBox(value: false, title: 'inglês'),
            ],
          ),
        )
      ),
    );
  }

  //IMPLEMENTE COM BASE NA CLASSE ABSTRATA, E NÃO NA CLASSE CONCRETA!!!!

  InputBorder _buildBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(color: Color.fromARGB(255, 241, 245, 246))
    );
  }

}