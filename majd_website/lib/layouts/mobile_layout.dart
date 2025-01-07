import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majd_website/components/mobile_components/contact_container.dart';
import 'package:majd_website/components/mobile_components/experiecne.dart';
import 'package:majd_website/components/mobile_components/info_container.dart';
import 'package:majd_website/components/mobile_components/projects_container.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key});

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _infoKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/Logo.png",
            width: 50,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade100,
        elevation: 0,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _scrollToSection(_infoKey);
            },
            child: Text(
              'Info',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.deepPurple,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _scrollToSection(_projectsKey);
            },
            child: Text(
              'Projects',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.deepPurple,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _scrollToSection(_experienceKey);
            },
            child: Text(
              'Experience',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.deepPurple,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _scrollToSection(_contactKey);
            },
            child: Text(
              'Contact',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          Container(
            key: _infoKey,
            child: const InfoContainer(
              isDesktop: false,
            ),
          ),
          Container(
            key: _projectsKey,
            child: MyProjects(
              isDesktop: false,
            ),
          ),
          Container(
            key: _experienceKey,
            child: MyExperience(
              isDesktop: false,
            ),
          ),
          Container(
            key: _contactKey,
            child: const MyContact(isDesktop: false),
          ),
          //const FunContainer(isDesktop: false),
        ],
      ),
    );
  }
}
