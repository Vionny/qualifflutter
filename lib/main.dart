
import 'package:flutter/material.dart';
import 'package:qualifflutter/home.dart';
import 'package:qualifflutter/login.dart';
import 'package:provider/provider.dart';
import 'package:qualifflutter/theme.dart';
void main(List<String> args) {

  return runApp(
    ChangeNotifierProvider(
      child: const AniMerch(),
      create: (BuildContext context) => ThemeProvider(false),
    )
);
}

class AniMerch extends StatelessWidget {
  const AniMerch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
            title: "AniMerch",
            theme: themeProvider.getTheme,
            home: const LoginPage(),
          );
      },
    );
  }
}
