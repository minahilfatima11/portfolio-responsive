import 'package:flutter/material.dart';
import 'package:web85/views/home-views/tablet-view/contact-me.dart';
import 'package:web85/views/home-views/tablet-view/featured-projects.dart';
import 'package:web85/views/home-views/tablet-view/services-view.dart';
import 'package:web85/views/home-views/tablet-view/tablet-view-home.dart';

class AboutMeTablet extends StatefulWidget {
  const AboutMeTablet({super.key});

  @override
  State<AboutMeTablet> createState() => _AboutMeTabletState();
}

class _AboutMeTabletState extends State<AboutMeTablet> {
  @override
  Widget build(BuildContext context) {
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
              MaterialPageRoute(builder: (context) => HomeViewTablet()),
            );
          }),
          _buildNavItem('About Me', Color(0xFF7562E0), () {}),
          _buildNavItem('Services', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServicesTablet()),
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

              // Responsive GridView for skill cards
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width > 900
                      ? 4 // Large screen: 4 columns
                      : width > 600
                          ? 3 // Medium screen: 3 columns
                          : 2, // Small screen: 2 columns
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2, // Adjust based on card size
                ),
                itemCount: 4, // Total skill cards
                itemBuilder: (context, index) {
                  final skillData = [
                    {
                      "title": "Flutter Development",
                      "icon": const Icon(Icons.code, color: Colors.white),
                      "color": const Color(0xFF7562E0),
                    },
                    {
                      "title": "Frontend Development",
                      "icon": const Icon(Icons.web, color: Colors.white),
                      "color": const Color(0xFF333645),
                    },
                    {
                      "title": "Mobile Development",
                      "icon":
                          const Icon(Icons.phone_android, color: Colors.white),
                      "color": const Color(0xFF333645),
                    },
                    {
                      "title": "Version Control",
                      "icon": const Icon(Icons.design_services,
                          color: Colors.white),
                      "color": const Color(0xFF333645),
                    },
                  ][index];

                  return _buildSkillCard(
                    skillData["title"] as String,
                    skillData["icon"] as Icon,
                    skillData["color"] as Color,
                  );
                },
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
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
