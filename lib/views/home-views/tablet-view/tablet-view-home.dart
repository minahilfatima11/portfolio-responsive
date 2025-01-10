import 'package:flutter/material.dart';

class HomeViewTablet extends StatefulWidget {
  const HomeViewTablet({super.key});

  @override
  State<HomeViewTablet> createState() => _HomeViewTabletState();
}

class _HomeViewTabletState extends State<HomeViewTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xff181824)),

                currentAccountPicture: CircleAvatar(),
                accountName: Text("Minahil"), accountEmail:Text("fminahil@gmail.com")),
          ListTile(leading : Icon(Icons.home),
          title: Text('Home'),),

            ListTile(leading : Icon(Icons.settings),
              title: Text('Home'),),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff181824),


      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF1E1E2A),
      ),
    );
  }
}
