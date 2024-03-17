import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Coloors {
  static Color backgroundColor = HexColor("1C1C1C");
  static Color accentColor = HexColor("#36bb93");
  static Color cardColor = HexColor("#262626");

  static TextStyle mainTitle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle mainContent = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle dateTitle = const TextStyle(
    fontSize: 12,
    color: Colors.white,
  );
}
