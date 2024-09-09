import 'package:deliveryapp/theme/dark_mode.dart';
import 'package:deliveryapp/theme/light_mode.dart';
import 'package:flutter/material.dart';



class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themData (ThemeData themeData){
    _themeData = themeData;
    notifyListeners();

  }

  void toggleTheme(){
    if (_themeData == lightMode) {
      themData = darkMode;
      
    } else {
      themData = lightMode;
    }
  }
} 