import 'package:flutter/material.dart';

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({super.key});

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,color: Color(0xFF1E1E2A),
      ),
    );
  }
}
