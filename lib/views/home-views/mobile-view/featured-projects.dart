import 'package:flutter/material.dart';
import 'package:web85/views/home-views/desktop-view/contact-me.dart';
import 'package:web85/views/home-views/desktop-view/services-view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web85/views/home-views/mobile-view/contact-me.dart';
import 'package:web85/views/home-views/mobile-view/homeview-mobile.dart';
import 'package:web85/views/home-views/mobile-view/services-view.dart';
import 'about-me.dart';

class FeaturedProjectsMobile extends StatelessWidget {
  const FeaturedProjectsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0D1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181824),
        title: const Text(
          "M.Fatima",
          style: TextStyle(
            color: Color(0xFF7562E0),
            fontSize: 24,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFF181824),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFF7562E0),
                ),
                child: const Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              _buildDrawerItem(context, 'Home', Icons.home, HomeViewMobile()),
              _buildDrawerItem(context, 'About Me', Icons.person, AboutMeMobile()),
              _buildDrawerItem(context, 'Services', Icons.design_services, ServicesViewMobile()),
              _buildDrawerItem(context, 'Contact', Icons.contact_mail, ContactMeMobile()),
            ],
          ),
        ),
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth < 600 ? 1 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: constraints.maxWidth < 600 ? 0.8 : 1,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final projects = [
                        {
                          'title': 'Facebook Clone',
                          'description': 'A social media platform clone with authentication, posts, comments, and live chat functionality.',
                          'image': 'assets/fb_clone.png',
                          'github': 'https://github.com/minahilfatima11/facebook_clone',
                          'linkedin': 'https://www.linkedin.com/posts/minahil-fatima-6011b428b_flutter-dart-mobileappdevelopment-activity-7271381284977823745--AXf?utm_source=share&utm_medium=member_desktop',
                        },
                        {
                          'title': 'Gold App',
                          'description': 'A video streaming app where users can stream live events and access video content from multiple genres.',
                          'image': 'assets/gold_app.jpg',
                          'github': 'https://github.com/minahilfatima11/gold-shop-app',
                          'linkedin': 'https://www.linkedin.com/posts/minahil-fatima-6011b428b_goldshopapp-frontenddevelopment-innovation-activity-7275441770514034689-7WSJ?utm_source=share&utm_medium=member_desktop',
                        },
                        {
                          'title': 'TODO App',
                          'description': 'A task management app with features to create, update, and manage daily tasks with reminders.',
                          'image': 'assets/todo.jpeg',
                          'github': 'https://github.com/minahilfatima11/todo_app',
                          'linkedin': 'https://www.linkedin.com/posts/minahil-fatima-6011b428b_flutter-todoapp-firebase-activity-7280534384988897280-Qwg2?utm_source=share&utm_medium=member_desktop',
                        },
                        {
                          'title': 'Whatsapp Business Clone',
                          'description': 'A messaging app clone designed for business communication, featuring multiple chat channels and business profiles.',
                          'image': 'assets/WA.jpeg',
                          'github': 'https://github.com/minahilfatima11/whatsapp-business-clone',
                          'linkedin': 'https://www.linkedin.com/posts/minahil-fatima-6011b428b_flutterdevelopment-dartprogramming-userinterface-activity-7283029451167195136-bdP0?utm_source=share&utm_medium=member_desktop',
                        },
                        {
                          'title': 'Spiritual Counter',
                          'description': 'A spiritual app to help users count their recitations and keep track of their spiritual journey.',
                          'image': 'assets/counter.png',
                          'github': 'https://github.com/minahilfatima11/spiritual_counter',
                          'linkedin': 'https://www.linkedin.com/posts/minahilfatima11_spiritual-counter-activity-xxxxxxx',
                        },
                        {
                          'title': 'Even Odd Checker',
                          'description': 'A simple app that allows users to check whether a number is even or odd.',
                          'image': 'assets/evenoddjpg.jpg',
                          'github': 'https://github.com/minahilfatima11/even-odd-checker',
                          'linkedin': 'https://www.linkedin.com/posts/minahil-fatima-6011b428b_flutter-dart-mobileappdevelopment-activity-7275758822323838976-XYKT?utm_source=share&utm_medium=member_desktop',
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  projects[index]['image']!,
                                  height: 184,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      _launchURL(projects[index]['linkedin']!);
                                    },
                                    child: const Text('View Live', style: TextStyle(color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF7C5CF4),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _launchURL(projects[index]['github']!);
                                    },
                                    child: const Text('GitHub Repo', style: TextStyle(color: Colors.white)),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunch(_url.toString())) {
      await launch(_url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildDrawerItem(BuildContext context, String title, IconData icon, Widget destination) {
    return ListTile(
      trailing: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
    );
  }
}
