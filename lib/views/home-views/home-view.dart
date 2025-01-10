import 'package:flutter/material.dart';
import 'package:web85/controller/widgets/responsivelayout.dart';
import 'package:web85/views/home-views/desktop-view/home-view.dart';
import 'package:web85/views/home-views/mobile-view/homeview-mobile.dart';
import 'package:web85/views/home-views/tablet-view/tablet-view-home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: HomeViewDesktop(),
      mobile: HomeViewMobile(),
      tablet: HomeViewTablet(),
    );
  }
}
