import 'package:flutter/material.dart';
import 'package:recipe_app/utils/validators.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.icon,
    this.controller,
    this.isPassword = false,
  });

  final String label;
  final TextEditingController? controller;
  final bool isPassword;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: icon,
        labelText: label,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 16),
        filled: true,
        fillColor: ColorScheme.of(context).secondary.withAlpha(50),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (isPassword && !isValidPassword(value)) {
          return 'Password must be at least 6 characters';
        }
        if (label == 'Email' && !isValidEmail(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }
}
