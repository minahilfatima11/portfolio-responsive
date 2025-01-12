import 'package:flutter/material.dart';
import 'package:web85/views/home-views/mobile-view/featured-projects.dart';
import 'package:web85/views/home-views/mobile-view/homeview-mobile.dart';
import 'about-me.dart';
import 'contact-me.dart';
import 'package:web85/views/home-views/desktop-view/featured-projects.dart';

class ServicesViewMobile extends StatefulWidget {
  const ServicesViewMobile({super.key});

  @override
  _ServicesMobileState createState() => _ServicesMobileState();
}

class _ServicesMobileState extends State<ServicesViewMobile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.03),
            const Text(
              "Services I Offer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: const Text(
                "I offer a wide range of services to cater to your needs, including Flutter development, frontend development, version control, and more.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                itemCount: 3, // Updated to 3 services
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          getServiceIcon(index),
                          size: 40,
                          color: const Color(0xFF7562E0),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          getServiceName(index),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            getServiceDescription(index),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeViewMobile()),
                    );
                  }),
                  _buildNavItem('About Me', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutMeMobile()),
                    );
                  }),
                  _buildNavItem('Services', () {}),
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
                      MaterialPageRoute(
                          builder: (context) => ContactMeMobile()),
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

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: onTap,
    );
  }
}
