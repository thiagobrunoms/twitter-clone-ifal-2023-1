import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:twitter_clone_ifal_2023/modules/signup/presentation/widgets/custom_checkbox/custom_checkbox_controller.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final String title;
  final Function(bool) callback;
  const CustomCheckBox({super.key, required this.title, required this.value, required this.callback});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  CustomCheckboxController controller = CustomCheckboxController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return CheckboxListTile(
          value: controller.isChecked,
          onChanged: (value) {
            controller.changeValue();
            widget.callback(value!);
          }, 
          title: Text(widget.title),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        );
      }
    );
  }

}