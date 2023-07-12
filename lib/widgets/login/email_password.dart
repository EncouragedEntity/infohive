import 'package:flutter/material.dart';
import 'package:infohive/widgets/login/entry_field.dart';

Widget emailPasswordWidget({
  required TextEditingController email,
  required TextEditingController password,
}) {
  return Column(
    children: <Widget>[
      entryField("Email", controller: email),
      entryField("Password", isPassword: true, controller: password),
    ],
  );
}
