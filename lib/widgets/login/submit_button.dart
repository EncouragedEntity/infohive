import 'package:flutter/material.dart';

import '../../constants/colors.dart';

Widget submitButton(BuildContext context, {required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap, // Invoke the onTap callback
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(2, 4),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
        gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              primary,
              secondary,
            ]),
      ),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 20, color: Color.fromARGB(232, 255, 255, 255)),
      ),
    ),
  );
}
