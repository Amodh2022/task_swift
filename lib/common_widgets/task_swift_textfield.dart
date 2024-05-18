import 'package:flutter/material.dart';
import 'package:task_swift/constants/color.dart';

class TaskSwiftTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  const TaskSwiftTextField(
      {super.key,
      this.textEditingController,
      this.validator,
      this.hintText,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle:
              const TextStyle(color: AppColors.pageIndicatorColorActive),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.pageIndicatorColorActive, width: 1))),
    );
  }
}
