import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web85/views/home-views/tablet-view/tablet-view-home.dart';
import 'about-me.dart';

class FeaturedProjectsTablet extends StatelessWidget {
  FeaturedProjectsTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 800;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0D1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181824),
        title: Text(
          "Portfolio",
          style: TextStyle(
            color: const Color(0xFF7562E0),
            fontSize: isLargeScreen ? 28 : 20,
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
            Text(
              'Featured Projects:',
              style: TextStyle(
                fontSize: isLargeScreen ? 32 : 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = (constraints.maxWidth > 1000)
                      ? 4
                      : (constraints.maxWidth > 700)
                          ? 3
                          : 2;

                  double childAspectRatio = (constraints.maxWidth > 1000)
                      ? 1.0
                      : (constraints.maxWidth > 700)
                          ? 0.8
                          : 0.75;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: _projects.length,
                    itemBuilder: (context, index) {
                      return _buildProjectCard(
                          context, _projects[index], isLargeScreen);
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

  final List<Map<String, String>> _projects = [
    {
      'title': 'Facebook Clone',
      'description':
          'A social media platform clone with authentication, posts, comments, and live chat functionality.',
      'image': 'assets/fb_clone.png',
      'github': 'https://github.com/minahilfatima11/facebook_clone',
      'linkedin':
          'https://www.linkedin.com/posts/minahil-fatima-6011b428b_flutter-dart-mobileappdevelopment-activity-7271381284977823745--AXf?utm_source=share&utm_medium=member_desktop',
    },
    {
      'title': 'Gold App',
      'description':
          'A video streaming app where users can stream live events and access video content from multiple genres.',
      'image': 'assets/gold_app.jpg',
      'github': 'https://github.com/minahilfatima11/gold-shop-app',
      'linkedin':
          'https://www.linkedin.com/posts/minahil-fatima-6011b428b_goldshopapp-frontenddevelopment-innovation-activity-7275441770514034689-7WSJ?utm_source=share&utm_medium=member_desktop',
    },
  ];

  Widget _buildProjectCard(
      BuildContext context, Map<String, String> project, bool isLargeScreen) {
    return Card(
      color: const Color(0xFF1C1833),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project['title']!,
              style: TextStyle(
                fontSize: isLargeScreen ? 20 : 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              project['description']!,
              style: TextStyle(
                fontSize: isLargeScreen ? 16 : 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  project['image']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _launchURL(project['linkedin']!),
                  child: const Text('View Live'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFffffff),
                    foregroundColor: Colors.black,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _launchURL(project['github']!),
                  child: const Text('GitHub Repo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFffffff),
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
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
}
