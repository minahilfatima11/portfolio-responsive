import 'package:flutter/material.dart';
import 'package:web85/views/home-views/desktop-view/contact-me.dart';
import 'package:web85/views/home-views/desktop-view/services-view.dart';

import 'about-me.dart';
import 'home-view.dart';

class FeaturedProjects extends StatelessWidget {
  const FeaturedProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      'image': 'assets/facebook_clone.png',
                      'github': 'https://github.com/minahilfatima11/facebook_clone',
                    },
                    {
                      'title': 'Gold App',
                      'description': 'A video streaming app where users can stream live events and access video content from multiple genres.',
                      'image': 'assets/gold_app.png',
                      'github': 'https://github.com/minahilfatima11/gold-shop-app',
                    },
                    {
                      'title': 'TODO App',
                      'description': 'A task management app with features to create, update, and manage daily tasks with reminders.',
                      'image': 'assets/todo_app.png',
                      'github': 'https://github.com/minahilfatima11/todo_app',
                    },
                    {
                      'title': 'Whatsapp Business Clone',
                      'description': 'A messaging app clone designed for business communication, featuring multiple chat channels and business profiles.',
                      'image': 'assets/whatsapp_business_clone.png',
                      'github': 'https://github.com/user/whatsapp_business_clone',
                    },
                    {
                      'title': 'Spiritual Counter',
                      'description': 'A spiritual app to help users count their recitations and keep track of their spiritual journey.',
                      'image': 'assets/spiritual_counter.png',
                      'github': 'https://github.com/minahilfatima11/spiritual_counter',
                    },
                    {
                      'title': 'Even Odd Checker',
                      'description': 'A simple app that allows users to check whether a number is even or odd.',
                      'image': 'assets/even_odd_checker.png',
                      'github': 'https://github.com/user/even_odd_checker',
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              projects[index]['image']!,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            projects[index]['title']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            projects[index]['description']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // You can add a URL launcher here to open a live project
                                },
                                child: const Text('View Live'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF7C5CF4),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Open the specific GitHub repo
                                  _launchURL(projects[index]['github']!);
                                },
                                child: const Text('GitHub Repo'),
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

  // Function to open GitHub link
  _launchURL(String url) async {
    //You need to add url_launcher package to your pubspec.yaml file to open URLs
    // final Uri _url = Uri.parse(url);
    // if (await canLaunch(_url.toString())) {
    //   await launch(_url.toString());
    // } else {
    //   throw 'Could not launch $url';
    // }
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
