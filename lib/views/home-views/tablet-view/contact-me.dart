import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web85/views/home-views/tablet-view/services-view.dart';
import 'package:web85/views/home-views/tablet-view/tablet-view-home.dart';

import 'about-me.dart';
import 'featured-projects.dart';

class ContactMeTablet extends StatelessWidget {
  const ContactMeTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
          _buildNavItem('Contact', const Color(0xFF7562E0), () {}),
        ],
      ),
      backgroundColor: const Color(0xFF0F0D1F),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Contact me, let\'s make magic together:',
                  style: TextStyle(
                    fontSize: screenWidth > 600 ? 28 : 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'Satisfied with me? Please contact me:',
                  style: TextStyle(
                    fontSize: screenWidth > 600 ? 18 : 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(Icons.facebook, 'https://www.facebook.com/your-profile'),
                    const SizedBox(width: 16),
                    _buildSocialIcon(Icons.email, 'mailto:fminahil16343@gmail.com'),
                    const SizedBox(width: 16),
                    _buildSocialIcon(Icons.link, 'https://your-portfolio-link.com'),
                    const SizedBox(width: 16),
                    _buildSocialIcon(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/in/your-profile'),
                  ],
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
                    print('Form submitted!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7C5CF4),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(
                      fontSize: screenWidth > 600 ? 18 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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

  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: 30),
      onPressed: () {
        _launchURL(url);
      },
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
          fillColor: const Color(0xFF1C1833),
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
