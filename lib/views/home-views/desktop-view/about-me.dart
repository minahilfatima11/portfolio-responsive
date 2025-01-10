import 'package:flutter/material.dart';
import 'package:web85/views/home-views/desktop-view/services-view.dart';

import 'contact-me.dart';
import 'featured-projects.dart';
import 'home-view.dart';

class AboutMeDesktop extends StatefulWidget {
  const AboutMeDesktop({super.key});

  @override
  State<AboutMeDesktop> createState() => _AboutMeDesktopState();
}

class _AboutMeDesktopState extends State<AboutMeDesktop> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
          _buildNavItem('About Me', Color(0xFF7562E0), () {

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
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF1E1E2A),
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              "About Me:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Hi, my name is Minahil Fatima, I am a Fullstack Web Developer, UI Designer, and Mobile Developer. I have honed my skills in Web Development and have a strong understanding of advanced UI design principles.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text(
                  "1+",
                  style: TextStyle(
                    color: Color(0xFF7562E0),
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: const Text(
                    "Years of experience. Specialized in building apps while ensuring a seamless web experience for end users.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSkillCard(
                  "UI & UX Designing",
                  const Icon(Icons.design_services, color: Colors.white),
                  const Color(0xFF7562E0),
                ),
                _buildSkillCard(
                  "Web Development",
                  const Icon(Icons.web, color: Colors.white),
                  const Color(0xFF333645),
                ),
                _buildSkillCard(
                  "Mobile Development",
                  const Icon(Icons.phone_android, color: Colors.white),
                  const Color(0xFF333645),
                ),
                _buildSkillCard(
                  "Flutter Development",
                  const Icon(Icons.code, color: Colors.white),
                  const Color(0xFF333645),
                ),
              ],
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

  Widget _buildSkillCard(String title, Icon icon, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(46),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
