import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade600,
   
    inversePrimary:Colors.grey.shade300,
    onPrimary: Colors.white70,
    error: Colors.grey.shade500,

    // for dark neumorphic design
     secondary: Colors.grey.shade800,
  )
);