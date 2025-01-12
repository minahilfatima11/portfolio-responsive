import 'package:flutter/material.dart';
import 'about-me.dart';
import 'contact-me.dart';
import 'featured-projects.dart';
import 'services-view.dart';

class HomeViewMobile extends StatefulWidget {
  const HomeViewMobile({super.key});

  @override
  State<HomeViewMobile> createState() => _HomeViewMobileState();
}

class _HomeViewMobileState extends State<HomeViewMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF181824),
        title: const Text(
          "M.Fatima",
          style: TextStyle(
            color: Color(0xFF7562E0),
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              showMenuFromTopLeft(context);
            },
          ),
        ],
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFF1E1E2A),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.3,
              width: height * 0.3,
              decoration: BoxDecoration(
                color: const Color(0xff7562E0),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('assets/profile.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Color(0xff7562E0), // Border color
                  width: 5, // Border width
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: Offset(0, 8), // Shadow position
                  ),
                ],
              ),
            )
,
            SizedBox(height: 28,),
            const Text(
              "Hello, I'm",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Minahil Fatima",
              style: TextStyle(
                color: Color(0xFF7562E0),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "A Flutter Developer & Frontend Developer, crafting seamless mobile & web experiences with a focus on performance, design, and user engagement.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutMeMobile()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff7562E0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    "About Me",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ServicesViewMobile()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xff7562E0)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    "Services",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff7562E0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}
void showMenuFromTopLeft(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Align(
        alignment: Alignment.topLeft,
        child: Material(
          color: const Color(0xFF1E1E2A),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNavItem('Home', () {

                }),
                _buildNavItem('About Me', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutMeMobile()),
                  );
                }),
                _buildNavItem('Services', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServicesViewMobile()),
                  );
                }),
                _buildNavItem('Projects', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FeaturedProjectsMobile()),
                  );
                }),
                _buildNavItem('Contact', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactMeMobile()),
                  );
                }),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildNavItem(String title, VoidCallback onTap) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 18),
    ),
    onTap: onTap,
  );
}