import 'package:flutter/material.dart';
import 'package:moni/views/styles/colors.dart';

class CustomDivider extends StatelessWidget {
  final double? indent;

  const CustomDivider({Key? key, this.indent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: indent ?? 0),
        height: 1.01,
        color: MoniAppColors.grey5);
  }
}
