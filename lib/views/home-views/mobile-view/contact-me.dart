import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web85/views/home-views/mobile-view/featured-projects.dart';
import 'package:web85/views/home-views/mobile-view/services-view.dart';

import '../desktop-view/featured-projects.dart';
import 'about-me.dart';
import 'homeview-mobile.dart';

class ContactMeMobile extends StatelessWidget {
  const ContactMeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
      backgroundColor: const Color(0xFF0F0D1F), // Dark background
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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

              ],
            ),
          ),
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
                    // Add functionality if needed
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
}
