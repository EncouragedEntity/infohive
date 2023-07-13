import 'package:flutter/material.dart';
import 'package:infohive/widgets/register/entry_field.dart';

Widget emailPasswordWidget() {
    return Column(
      children: <Widget>[
        entryField("Username"),
        entryField("Email"),
        entryField("Password", isPassword: true),
        entryField("Confirm password", isPassword: true),
      ],
    );
  }