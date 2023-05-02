import 'package:flutter/material.dart';

class ThemeStyles {
  static const headerDefault = TextStyle(
    color: Colors.black87,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  static final header14 = headerDefault.copyWith(fontSize: 14.0);
  static final header12 = headerDefault.copyWith(fontSize: 12.0);

  static const regularDefault = TextStyle(
    color: ThemeColors.black87,
    fontSize: 12.0,
  );

  static final subheader = regularDefault.copyWith(color: ThemeColors.black54);
}

class ThemeColors {
  static const primary = Colors.blueAccent;
  static const primaryLight = Colors.blueAccent;
  static const black87 = Colors.black87;
  static const black54 = Colors.black54;
  static const black45 = Colors.black45;
  static const black38 = Colors.black38;
}
