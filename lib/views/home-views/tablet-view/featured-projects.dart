import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeaturedProjectsTablet extends StatelessWidget {
  const FeaturedProjectsTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch screen width to determine breakpoints
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth <= 1024 && screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0D1F),
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
          _buildNavItem('Home', Colors.white, () {}),
          _buildNavItem('About Me', Colors.white, () {}),
          _buildNavItem('Services', Colors.white, () {}),
          _buildNavItem('Projects', const Color(0xFF7562E0), () {}),
          _buildNavItem('Contact', Colors.white, () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Featured Projects:',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 2 : 3, // 2 for tablet, 3 for desktop
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final projects = [
                    {
                      'title': 'Facebook Clone',
                      'description': 'A social media platform clone with authentication, posts, comments, and live chat functionality.',
                      'image': 'assets/fb_clone.png',
                      'github': 'https://github.com/minahilfatima11/facebook_clone',
                      'linkedin': 'https://www.linkedin.com/posts/example1',
                    },
                    {
                      'title': 'Gold App',
                      'description': 'A video streaming app where users can stream live events and access video content from multiple genres.',
                      'image': 'assets/gold_app.jpg',
                      'github': 'https://github.com/minahilfatima11/gold-shop-app',
                      'linkedin': 'https://www.linkedin.com/posts/example2',
                    },
                    {
                      'title': 'TODO App',
                      'description': 'A task management app with features to create, update, and manage daily tasks with reminders.',
                      'image': 'assets/todo.jpeg',
                      'github': 'https://github.com/minahilfatima11/todo_app',
                      'linkedin': 'https://www.linkedin.com/posts/example3',
                    },
                    {
                      'title': 'Whatsapp Business Clone',
                      'description': 'A messaging app clone designed for business communication, featuring multiple chat channels and business profiles.',
                      'image': 'assets/WA.jpeg',
                      'github': 'https://github.com/minahilfatima11/whatsapp-business-clone',
                      'linkedin': 'https://www.linkedin.com/posts/example4',
                    },
                    {
                      'title': 'Spiritual Counter',
                      'description': 'A spiritual app to help users count their recitations and keep track of their spiritual journey.',
                      'image': 'assets/counter.png',
                      'github': 'https://github.com/minahilfatima11/spiritual_counter',
                      'linkedin': 'https://www.linkedin.com/posts/example5',
                    },
                    {
                      'title': 'Even Odd Checker',
                      'description': 'A simple app that allows users to check whether a number is even or odd.',
                      'image': 'assets/evenoddjpg.jpg',
                      'github': 'https://github.com/minahilfatima11/even-odd-checker',
                      'linkedin': 'https://www.linkedin.com/posts/example6',
                    },
                  ];

                  return Card(
                    color: const Color(0xFF1C1833),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          Center(
                            child: Text(
                              projects[index]['title']!,
                              style: TextStyle(
                                fontSize: isTablet ? 18 : 20, // Adjust font size
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: Text(
                              projects[index]['description']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: isTablet ? 12 : 14, // Adjust font size
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                projects[index]['image']!,
                                height: isTablet ? 150 : 200, // Adjust image size
                                width: isTablet ? 150 : 200, // Adjust image size
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _launchURL(projects[index]['linkedin']!);
                                },
                                child: Text(
                                  'View Live',
                                  style: TextStyle(
                                    fontSize: isTablet ? 12 : 14, // Adjust button text size
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF7C5CF4),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _launchURL(projects[index]['github']!);
                                },
                                child: Text(
                                  'GitHub Repo',
                                  style: TextStyle(
                                    fontSize: isTablet ? 12 : 14, // Adjust button text size
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF7C5CF4),
                                ),
                              ),
                            ],
                          ),
                        ],
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

  // Function to open URLs
  _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunch(_url.toString())) {
      await launch(_url.toString());
    } else {
      throw 'Could not launch $url';
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
