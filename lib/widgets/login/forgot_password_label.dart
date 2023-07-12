import 'package:flutter/material.dart';

Widget forgotPasswordLabel({required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap, // Invoke the onTap callback
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerRight,
      child: const Text(
        'Forgot Password ?',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    ),
  );
}

