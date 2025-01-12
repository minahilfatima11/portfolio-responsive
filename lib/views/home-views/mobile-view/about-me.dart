import 'package:flutter/material.dart';
import 'package:web85/views/home-views/mobile-view/homeview-mobile.dart';
import 'contact-me.dart';
import 'featured-projects.dart';
import 'services-view.dart';

class AboutMeMobile extends StatefulWidget {
  const AboutMeMobile({super.key});

  @override
  State<AboutMeMobile> createState() => _AboutMeMobileState();
}

class _AboutMeMobileState extends State<AboutMeMobile> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF1E1E2A),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "About Me:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Hi, my name is Minahil Fatima, I am a Flutter Developer and Frontend Web Developer. "
                        "I specialize in creating responsive, user-friendly web and mobile applications. "
                        "I have honed my skills in building high-quality apps that deliver seamless experiences across platforms.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Skills:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      _buildSkillCard(
                        "Flutter Development",
                        const Icon(Icons.code, color: Colors.white),
                        const Color(0xFF7562E0),
                      ),
                      const SizedBox(height: 16),
                      _buildSkillCard(
                        "Frontend Development",
                        const Icon(Icons.web, color: Colors.white),
                        const Color(0xFF333645),
                      ),
                      const SizedBox(height: 16),
                      _buildSkillCard(
                        "Mobile Development",
                        const Icon(Icons.phone_android, color: Colors.white),
                        const Color(0xFF333645),
                      ),
                      const SizedBox(height: 16),
                      _buildSkillCard(
                        "Version Control",
                        const Icon(Icons.design_services, color: Colors.white),
                        const Color(0xFF333645),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SlideTransition(
            position: _offsetAnimation,
            child: Container(
              width: width * 0.8,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFF1E1E2A),
              child: _buildMenu(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(String title, Icon icon, Color bgColor) {
    return Center(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        _buildNavItem('Home', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeViewMobile()),
          );
        }),
        _buildNavItem('About Me', () {}),
        _buildNavItem('Services', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ServicesViewMobile()),
          );
        }),
        _buildNavItem('Projects', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FeaturedProjectsMobile()),
          );
        }),
        _buildNavItem('Contact', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactMeMobile()),
          );
        }),
      ],
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
