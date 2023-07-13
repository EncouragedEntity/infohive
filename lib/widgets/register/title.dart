import 'package:flutter/material.dart';

import '../../constants/colors.dart';

Widget title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'info',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: secondary),
          children: [
            TextSpan(
              text: 'hi',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 've',
              style: TextStyle(color: secondary, fontSize: 30),
            ),
          ]),
    );
  }