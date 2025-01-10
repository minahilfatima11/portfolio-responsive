import 'package:flutter/material.dart';
import 'package:web85/views/home-views/desktop-view/featured-projects.dart';

import 'about-me.dart';
import 'contact-me.dart';
import 'home-view.dart';

class ServicesDesktop extends StatefulWidget {
  const ServicesDesktop({super.key});

  @override
  _ServicesDesktopState createState() => _ServicesDesktopState();
}

class _ServicesDesktopState extends State<ServicesDesktop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF181824),
        title: const Text(
          "Portfolio",
          style: TextStyle(
            color: Color(0xFF7562E0),
            fontSize: 24,
          ),
        ),
        actions: [
          _buildNavItem('Home', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeViewDesktop()), // Navigate to Home screen
            );
          }),
          _buildNavItem('About Me', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutMeDesktop()), // Navigate to About Me screen
            );
          }),
          _buildNavItem('Services',Color(0xFF7562E0), () {

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.05),
            const Text(
              "Services I Offer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: const Text(
                "We offer a wide range of services to cater to your needs, "
                    "including web development, UI/UX design, data analytics, and more.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: 6, // Example: 6 services
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                     // color: const Color(0xff282A36),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Color(0xFF7562E0)) ,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        getServiceName(index),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getServiceName(int index) {
    return "Service ${index + 1}";
  }
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