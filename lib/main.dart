import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'views/screens/cluster_page.dart';

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
        // fontFamily: "DMSans",
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: kDarkBackground,
              centerTitle: true),
          primaryColor: kPrimaryColor),
      home: const ClusterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
