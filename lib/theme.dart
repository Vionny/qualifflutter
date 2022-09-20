import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier{
  late ThemeData _selectedTheme;

  ThemeData dark = ThemeData.dark();
  ThemeData light= ThemeData(primarySwatch: Colors.purple, brightness: Brightness.light);

  ThemeProvider(bool isDarkmode){
    _selectedTheme = isDarkmode ? dark : light;
  }

  void swapTheme() {
    _selectedTheme = _selectedTheme == dark ? light: dark;
    notifyListeners();
  }


  ThemeData get getTheme => _selectedTheme;


}
