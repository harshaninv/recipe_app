import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message) {
  final colorScheme = Theme.of(context).colorScheme;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: colorScheme.onError,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      backgroundColor: colorScheme.errorContainer,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: 280,
      duration: const Duration(milliseconds: 10000),
      showCloseIcon: true,
      closeIconColor: colorScheme.onError,
    ),
  );
}
