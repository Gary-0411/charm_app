import 'package:flutter/material.dart';

class AppTheme {
  // 1.抽取相同的样式
  static const double _titleFontSize = 20;

  // 2.亮色主题
  static final ThemeData lightTheme = ThemeData(
    // primaryColor: Colors.red,
    backgroundColor: Colors.red,
  );

  // 3.暗黑主题
  static final ThemeData darkTheme = ThemeData();
}
