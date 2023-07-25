import 'package:flutter/material.dart';

Widget backButton(BuildContext context, {required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: Text(
          'Back',
          style: TextStyle(fontSize: 15),
        ),
      ),
    ),
  );
}
