import 'package:flutter/material.dart';
import 'package:web85/views/home-views/desktop-view/contact-me.dart';
import 'package:web85/views/home-views/desktop-view/services-view.dart';
import 'package:url_launcher/url_launcher.dart';  // Import url_launcher

import 'about-me.dart';
import 'home-view.dart';

class FeaturedProjects extends StatelessWidget {
  const FeaturedProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0D1F),
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
              MaterialPageRoute(builder: (context) => HomeViewDesktop()),
            );
          }),
          _buildNavItem('About Me', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutMeDesktop()),
            );
          }),
          _buildNavItem('Services', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServicesDesktop()),
            );
          }),
          _buildNavItem('Projects', Color(0xFF7562E0), () {}),
          _buildNavItem('Contact', Colors.white, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactMeDesktop()),
            );
          }),
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
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
                      'linkedin': 'https://www.linkedin.com/posts/minahil-fatima-6011b428b_flutter-dart-mobileappdevelopment-activity-7271381284977823745--AXf?utm_source=share&utm_medium=member_desktop', // LinkedIn post URL for the project
                    },
                    {
                      'title': 'Gold App',
                      'description': 'A video streaming app where users can stream live events and access video content from multiple genres.',
                      'image': 'assets/gold_app.jpg',
                      'github': 'https://github.com/minahilfatima11/gold-shop-app',
                      'linkedin': 'https://www.linkedin.com/posts/minahil-fatima-6011b428b_goldshopapp-frontenddevelopment-innovation-activity-7275441770514034689-7WSJ?utm_source=share&utm_medium=member_desktop', // LinkedIn post URL for the project
                    },
                    {
                      'title': 'TODO App',
                      'description': 'A task management app with features to create, update, and manage daily tasks with reminders.',
                      'image': 'assets/todo.jpeg',
                      'github': 'https://github.com/minahilfatima11/todo_app',
                      'linkedin': 'https://www.linkedin.com/posts/minahil-fatima-6011b428b_flutter-todoapp-firebase-activity-7280534384988897280-Qwg2?utm_source=share&utm_medium=member_desktop', // LinkedIn post URL for the project
                    },
                    {
                      'title': 'Whatsapp Business Clone',
                      'description': 'A messaging app clone designed for business communication, featuring multiple chat channels and business profiles.',
                      'image': 'assets/WA.jpeg',
                      'github': 'https://github.com/minahilfatima11/whatsapp-business-clone',
                      'linkedin': 'https://www.linkedin.com/posts/minahil-fatima-6011b428b_flutterdevelopment-dartprogramming-userinterface-activity-7283029451167195136-bdP0?utm_source=share&utm_medium=member_desktop', // LinkedIn post URL for the project
                    },
                    {
                      'title': 'Spiritual Counter',
                      'description': 'A spiritual app to help users count their recitations and keep track of their spiritual journey.',
                      'image': 'assets/counter.png',
                      'github': 'https://github.com/minahilfatima11/spiritual_counter',
                      'linkedin': 'https://www.linkedin.com/posts/minahilfatima11_spiritual-counter-activity-xxxxxxx', // LinkedIn post URL for the project
                    },
                    {
                      'title': 'Even Odd Checker',
                      'description': 'A simple app that allows users to check whether a number is even or odd.',
                      'image': 'assets/evenoddjpg.jpg',
                      'github': 'https://github.com/minahilfatima11/even-odd-checker',
                      'linkedin': 'https://www.linkedin.com/posts/minahil-fatima-6011b428b_flutter-dart-mobileappdevelopment-activity-7275758822323838976-XYKT?utm_source=share&utm_medium=member_desktop', // LinkedIn post URL for the project
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
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: Text(
                              projects[index]['description']!,
                              style: const TextStyle(
                                fontSize: 14,
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
                                height: 200,
                                width: 200,  // Adjust width to take up full space in the card
                                fit: BoxFit.cover,  // Ensure the image covers the area
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Open the specific LinkedIn post for the project
                                  _launchURL(projects[index]['linkedin']!);
                                },
                                child: const Text('View Live' , style: TextStyle(color: Colors.white),),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF7C5CF4),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Open the specific GitHub repo
                                  _launchURL(projects[index]['github']!);
                                },
                                child: const Text('GitHub Repo', style: TextStyle(color: Colors.white),),
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
