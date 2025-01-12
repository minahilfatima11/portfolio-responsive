import 'package:flutter/material.dart';
import 'about-me.dart';
import 'contact-me.dart';
import 'featured-projects.dart';
import 'services-view.dart';


class HomeViewDesktop extends StatefulWidget {
  const HomeViewDesktop({super.key});

  @override
  State<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

class _HomeViewDesktopState extends State<HomeViewDesktop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF181824),
        title: const Text(
          "M.Fatima",
          style: TextStyle(
            color: Color(0xFF7562E0),
            fontSize: 24,
          ),
        ),
        actions: [
          _buildNavItem('Home', Color(0xFF7562E0), () {

          }),
          _buildNavItem('About Me', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutMeDesktop()), // Navigate to Home screen
            );
          }),
          _buildNavItem('Services',Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServicesDesktop()), // Navigate to Services screen
            );
          }),
          _buildNavItem('Projects', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FeaturedProjects()), // Navigate to Services screen
            );
          }),
          _buildNavItem('Contact', Colors.white, () {
            // Already on Contact screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactMeDesktop()), // Navigate to Projects screen
            );
          }),

        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFF1E1E2A),
        child: Row(
          children: [
            // Left Section
            Container(
              width: width * 0.5,
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello, I'm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Minahil Fatima",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "A Flutter Developer & Frontend Developer, crafting seamless mobile & web experiences with a focus on performance, design, and user engagement.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutMeDesktop()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff7562E0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text(
                          "About Me",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ServicesDesktop()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xff7562E0)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text(
                          "Services",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff7562E0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Right Section
            Container(
              width: width * 0.5,
              alignment: Alignment.center,
              child: Container(
                height: height * 0.5,
                width: height * 0.5,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          title,
          style: TextStyle(color: color, fontSize: 18),
        ),
      ),
    );
  }
}
