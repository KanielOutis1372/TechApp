// ignore_for_file: constant_identifier_names, use_full_hex_values_for_flutter_colors, non_constant_identifier_names

import 'package:flutter/material.dart';

class MyDefinition {
  static const Color PRIMARY_COLOR =
      Color(0xFF67C4A7); //Button, Fill icon, Link button
  static const Color SECONDARY_COLOR_1 =
      Color(0xFF393F42); //Title, Text button, Text field label
  static const Color SECONDARY_COLOR_2 =
      Color(0xFF939393); //Paragraph, disable menu, inactive menu
  static const Color ERROR_COLOR = Color(0xFFD65B5B); //an error text / message
  static const Color WARNING_COLOR =
      Color(0xFFF79008); //Waring text or notification
  static const Color SUCCESS_COLOR = Color(0xFFF12B76A);
  static final Color? TEXT_BUTTON_COLOR = Colors.grey[100];

  static const double PRIMARY_FONT_SIZE = 18; // text button color
  static const double SUB_FONT_SIZE = 14; // text sub

  static const double FONT_SIZE_ICON = 30; // text button color

  static const double PADDING_HORI = 16; // padding layout
}
