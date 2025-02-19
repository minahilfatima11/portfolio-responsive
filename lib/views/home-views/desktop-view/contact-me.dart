import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'about-me.dart';
import 'featured-projects.dart';
import 'home-view.dart';
import 'services-view.dart'; // Import the package for LinkedIn icon

class ContactMeDesktop extends StatelessWidget {
  const ContactMeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
          _buildNavItem('Services', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServicesDesktop()), // Navigate to Services screen
            );
          }),
          _buildNavItem('Projects', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FeaturedProjects()), // Navigate to Projects screen
            );
          }),
          _buildNavItem('Contact', Color(0xFF7562E0), () {
            // Already on Contact screen
          }),
        ],
      ),
      backgroundColor: const Color(0xFF0F0D1F), // Dark background
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Contact me, let\'s make magic together:',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF7562E0),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Satisfied with me? Please contact me:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                _buildTextField(hintText: 'Name', screenWidth: screenWidth),
                const SizedBox(height: 16),
                _buildTextField(hintText: 'Email', screenWidth: screenWidth),
                const SizedBox(height: 16),
                _buildTextField(
                  hintText: 'Message',
                  screenWidth: screenWidth,
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add your form submission logic here
                    print('Form submitted!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7C5CF4), // Button color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 16,
                      color : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Replaced Facebook icon with WhatsApp
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 30), // WhatsApp icon
                      onPressed: () {
                        _launchURL('https://wa.me/923085588200'); // WhatsApp number link
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.email, color: Colors.white, size: 30),
                      onPressed: () {
                        _launchURL('mailto:fminahil16343@gmail.com'); // Email URL
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.github, color: Colors.white, size: 30),
                      onPressed: () {
                        _launchURL('https://github.com/minahilfatima11'); // Portfolio URL
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.linkedin, color: Colors.white, size: 30), // LinkedIn icon
                      onPressed: () {
                        _launchURL('https://www.linkedin.com/in/your-profile'); // LinkedIn URL
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],

            ),

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

  Widget _buildTextField({
    required String hintText,
    required double screenWidth,
    int maxLines = 1,
  }) {
    return SizedBox(
      width: screenWidth > 600 ? 400 : screenWidth * 0.9,
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: const Color(0xFF1C1833), // Dark field background
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
