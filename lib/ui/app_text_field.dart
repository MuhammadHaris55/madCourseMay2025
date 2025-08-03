import 'package:flutter/material.dart';

Widget AppTextField({
  required TextEditingController controller,
  required String hintText,
  bool isEnable = true,
}) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: hintText,
      // enabled: isEnable ?? true,
      enabled: isEnable,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.red),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.purple),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.amberAccent),
      ),
    ),
  );
}
