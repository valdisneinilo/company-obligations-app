import 'package:material_ui/material_ui.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF6A10D),
      brightness: Brightness.light,
    ),
  );
}