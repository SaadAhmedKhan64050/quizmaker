// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 25),
      children: const <TextSpan>[
        TextSpan(
          text: '                Quiz',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
        
        ),
        TextSpan(
            text: 'Maker',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue))
      ],
    ),
  );
}
