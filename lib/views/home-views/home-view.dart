import 'package:flutter/material.dart';
import 'package:web85/controller/widgets/responsivelayout.dart';
import 'package:web85/views/home-views/desktop-view/home-view.dart';
import 'package:web85/views/home-views/mobile-view/homeview-mobile.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<State<HomeViewDesktop>> _desktopKey = GlobalKey();
  final GlobalKey<State<HomeViewMobile>> _mobileKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      desktop: HomeViewDesktop(
        key: _desktopKey,
      ),
      mobile: HomeViewMobile(
        key: _mobileKey,
      ),

    );
  }
}
