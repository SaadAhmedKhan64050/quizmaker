// ignore_for_file: unused_import, prefer_const_constructors, non_constant_identifier_names, prefer_if_null_operators

import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 25),
      children: const <TextSpan>[
        TextSpan(
          text: 'Quiz',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
        ),
        TextSpan(
            text: 'Maker',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue))
      ],
    ),
  );
}

Widget blueButton({required BuildContext context, required String label, ButtonWidth}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(30)),
    alignment: Alignment.center,
    width: ButtonWidth != null
        ? ButtonWidth
        : MediaQuery.of(context).size.width - 48,
    child: Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}
