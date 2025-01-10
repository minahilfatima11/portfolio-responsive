import 'package:flutter/material.dart';
import 'package:web85/views/home-views/desktop-view/services-view.dart';
import 'package:web85/views/home-views/tablet-view/tablet-view-home.dart';
import 'contact-me.dart';
import 'featured-projects.dart';


class AboutMeTablet extends StatefulWidget {
  const AboutMeTablet({super.key});

  @override
  State<AboutMeTablet> createState() => _AboutMeTabletState();
}

class _AboutMeTabletState extends State<AboutMeTablet> {
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
              MaterialPageRoute(builder: (context) => HomeViewTablet()),
            );
          }),
          _buildNavItem('About Me', Color(0xFF7562E0), () {}),
          _buildNavItem('Services', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServicesDesktop()),
            );
          }),
          _buildNavItem('Projects', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FeaturedProjectsTablet()),
            );
          }),
          _buildNavItem('Contact', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactMeTablet()),
            );
          }),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF1E1E2A),
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
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
                "Hi, my name is Minahil Fatima, I am a Flutter Developer and Frontend Web Developer. "
                    "I specialize in creating responsive, user-friendly web and mobile applications. "
                    "I have honed my skills in building high-quality apps that deliver seamless experiences across platforms.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),

              const SizedBox(height: 32),
              // Adjusted row for tablet screen
              width > 600 // Check if the screen width is larger than a tablet size
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSkillCard(
                    "Flutter Development",
                    const Icon(Icons.code, color: Colors.white),
                    const Color(0xFF7562E0),
                  ),
                  _buildSkillCard(
                    "Frontend Development",
                    const Icon(Icons.web, color: Colors.white),
                    const Color(0xFF333645),
                  ),
                  _buildSkillCard(
                    "Mobile Development",
                    const Icon(Icons.phone_android, color: Colors.white),
                    const Color(0xFF333645),
                  ),
                  _buildSkillCard(
                    "Version Control",
                    const Icon(Icons.design_services, color: Colors.white),
                    const Color(0xFF333645),
                  ),
                ],
              )
                  : Column(
                children: [
                  _buildSkillCard(
                    "Flutter Development",
                    const Icon(Icons.code, color: Colors.white),
                    const Color(0xFF7562E0),
                  ),
                  const SizedBox(height: 16),
                  _buildSkillCard(
                    "Frontend Development",
                    const Icon(Icons.web, color: Colors.white),
                    const Color(0xFF333645),
                  ),
                  const SizedBox(height: 16),
                  _buildSkillCard(
                    "Mobile Development",
                    const Icon(Icons.phone_android, color: Colors.white),
                    const Color(0xFF333645),
                  ),
                  const SizedBox(height: 16),
                  _buildSkillCard(
                    "Version Control",
                    const Icon(Icons.design_services, color: Colors.white),
                    const Color(0xFF333645),
                  ),
                ],
              ),
            ],
          ),
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
