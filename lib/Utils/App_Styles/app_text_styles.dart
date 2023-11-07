import 'package:flutter/material.dart';

class AppTextStyles {
  ///fontSize 14 , Black , Bold
  static const TextStyle heading1 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  ///Text Styles of fontSize20to400 and color white
  static const TextStyle fontSize20to400 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    overflow: TextOverflow.ellipsis,
  );
}
