import 'package:flutter/material.dart';
import 'package:my_beats/themes/dark_mode.dart';
import 'package:my_beats/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  //initially light mode
  ThemeData _themeData = LightMode;

  //get theme
  ThemeData get themeData => _themeData;

  // is dark mode
  bool get isDarkMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData themeData){
    _themeData = themeData;

    //update UI
    notifyListeners();
  }

  //toggle theme
  void toggleTheme(){
    if(_themeData == LightMode){
      themeData =darkMode;
    }else{
      themeData = LightMode;
    }
  }

} 