import 'package:flutter/material.dart';

const Color _colorBlue = Color(0xB92BB8FA);
const Color _colorGrey700 = Color(0x76AAA9A9);

const List<Color> _colorThemes = [
  Colors.black,
  Colors.red,
  Colors.yellow,
  _colorBlue,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Colors must be between 0-3');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            primary: Colors.black,
            secondary: _colorGrey700,
            brightness: Brightness.light));
  }
}
