import 'package:flutter/material.dart';
import 'package:web85/views/home-views/home-view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent[200]!),
          useMaterial3: true,
        ),
        home: HomeView() //const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
