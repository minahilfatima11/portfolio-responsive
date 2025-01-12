import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {

  Widget mobile;
  Widget desktop;
  ResponsiveLayout(
      {super.key,
      required this.desktop,
      required this.mobile,
     });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 550)
        return mobile;

      else
        return desktop;
    });
  }
}
