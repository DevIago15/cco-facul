import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardtype;
  final TextInputAction inputAction;
  final String label;
  final int maxLines;
  final bool isLabelEnabled;

  const CustomFormField({
    super.key,
    required this.controller,
    required this.keyboardtype,
    required this.inputAction,
    required this.label,
    this.maxLines = 1,
    this.isLabelEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value!.isEmpty){
          return "Ops, informe o valor!";
        }        
      },
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardtype,
      textInputAction: inputAction,
      cursorColor: Colors.yellow,
      decoration: InputDecoration(
        labelText: isLabelEnabled ? label : null,
        labelStyle: const TextStyle(color: Colors.yellow),
      ),
    );
  }
}
