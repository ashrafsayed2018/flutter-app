import 'package:flutter/material.dart';
import 'package:forsale/values/branding_color.dart';

showSnackbar(Color color, String message, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 4),
      backgroundColor: color,
      content: Text(message),
    ),
  );
}
