import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle bold = TextStyle(
      // fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 12,
      // height: 0.5,
      fontWeight: FontWeight.w600);

  static const TextStyle medium = TextStyle(
    // fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 12,
      // height: 0.5,
      fontWeight: FontWeight.w400);

  static const TextStyle light = TextStyle(
    // fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 12,
      // height: 0.5,
      fontWeight: FontWeight.w300);
}