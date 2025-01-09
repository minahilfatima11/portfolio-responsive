import 'package:flutter/material.dart';
import 'package:web85/views/home-views/desktop-view/featured-projects.dart';
import 'package:web85/views/home-views/tablet-view/featured-projects.dart';
import 'package:web85/views/home-views/tablet-view/tablet-view-home.dart';
import 'about-me.dart';
import 'contact-me.dart';

class ServicesTablet extends StatelessWidget {
  const ServicesTablet({super.key});

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
              MaterialPageRoute(builder: (context) => HomeViewTablet()),
            );
          }),
          _buildNavItem('About Me', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutMeTablet()),
            );
          }),
          _buildNavItem('Services', Color(0xFF7562E0), () {}),
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
                "including Flutter development, frontend development, version control, and more.",
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Determine the number of columns based on screen width
                  int crossAxisCount;
                  double childAspectRatio;
                  double fontSizeTitle;
                  double fontSizeDescription;

                  if (constraints.maxWidth >= 1200) {
                    crossAxisCount = 3; // Desktop
                    childAspectRatio = 1.2;
                    fontSizeTitle = 18; // Adjust title size for desktop
                    fontSizeDescription =
                        14; // Adjust description size for desktop
                  } else if (constraints.maxWidth >= 600) {
                    crossAxisCount = 2; // Tablet
                    childAspectRatio = 1.4;
                    fontSizeTitle = 16; // Adjust title size for tablet
                    fontSizeDescription =
                        12; // Adjust description size for tablet
                  } else {
                    crossAxisCount = 1; // Small screens (mobile)
                    childAspectRatio = 1.6;
                    fontSizeTitle = 14; // Adjust title size for mobile
                    fontSizeDescription =
                        10; // Adjust description size for mobile
                  }

                  return GridView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth * 0.1),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFF7562E0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              getServiceIcon(index),
                              size: 40,
                              color: const Color(0xFF7562E0),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              getServiceName(index),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    fontSizeTitle, // Adjusted for screen size
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                getServiceDescription(index),
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize:
                                      fontSizeDescription, // Adjusted for screen size
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
    switch (index) {
      case 0:
        return "Flutter Development";
      case 1:
        return "Frontend Development";
      case 2:
        return "Version Control";
      default:
        return "Service ${index + 1}";
    }
  }

  IconData getServiceIcon(int index) {
    switch (index) {
      case 0:
        return Icons.flutter_dash;
      case 1:
        return Icons.code;
      case 2:
        return Icons.web;
      default:
        return Icons.help_outline;
    }
  }

  String getServiceDescription(int index) {
    switch (index) {
      case 0:
        return "Building beautiful mobile apps with Flutter for Android and iOS.";
      case 1:
        return "Creating responsive and interactive websites with modern frontend technologies.";
      case 2:
        return "Managing source code with Git and version control best practices.";
      default:
        return "Service description here.";
    }
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
