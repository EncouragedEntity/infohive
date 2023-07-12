import 'package:flutter/material.dart';
Widget title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'info',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xffe46b10)),
          children: [
            TextSpan(
              text: 'hi',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 've',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }