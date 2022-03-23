import 'package:flutter/material.dart';
import 'package:moni/views/screens/splash.dart';
import 'package:moni/views/styles/colors.dart';

void main() {
  runApp(const MoniApp());
}

class MoniApp extends StatelessWidget {
  const MoniApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Moni",
      theme: ThemeData(
          fontFamily: "DMSans",
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: MoniAppColors.darkDark,
              centerTitle: true),
          primaryColor: MoniAppColors.primaryBrandBase),
      home: const SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
