// ignore_for_file: constant_identifier_names

import 'package:fit_tracker_apps/src/utils/fonts.dart';
import 'package:flutter/material.dart';

enum InputTextMainType { DEFAULT, NUMBER, PASSWORD }

class InputTextMain extends StatelessWidget {
  final TextEditingController controller;
  final String initialValue;
  final String label;
  final InputTextMainType type;
  final void Function(String)? onChanged;
  const InputTextMain({
    Key? key,
    required this.controller,
    required this.label,
    this.type = InputTextMainType.DEFAULT,
    this.initialValue = '',
    this.onChanged,
  }) : super(key: key);

  TextInputType getKeyboardType() {
    late TextInputType result;
    switch (type) {
      case InputTextMainType.NUMBER:
        result = TextInputType.number;
        break;
      default:
        result = TextInputType.text;
        break;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        keyboardType: getKeyboardType(),
        obscureText: type == InputTextMainType.PASSWORD,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: Fonts.h5,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
