import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majd_website/components/mobile_components/contact_container.dart';
import 'package:majd_website/components/mobile_components/experiecne.dart';
import 'package:majd_website/components/mobile_components/info_container.dart';
import 'package:majd_website/components/mobile_components/my_education.dart';
import 'package:majd_website/components/mobile_components/projects_container.dart';

class SmallLayout extends StatelessWidget {
  SmallLayout({super.key});

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _infoKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();

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
      ),
      drawer: Drawer(
        width: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Logo or Title (optional)
            DrawerHeader(
              child: Text(
                'Navigation',
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                'Info',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop(); // Close the drawer
                _scrollToSection(_infoKey);
              },
            ),
            ListTile(
              title: Text(
                'Projects',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                _scrollToSection(_projectsKey);
              },
            ),
            ListTile(
              title: Text(
                'Experience',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                _scrollToSection(_experienceKey);
              },
            ),
            ListTile(
              title: Text(
                'Education',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                _scrollToSection(_educationKey);
              },
            ),
            ListTile(
              title: Text(
                'Contact',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.deepPurple,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                _scrollToSection(_contactKey);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              key: _infoKey,
              child: const InfoContainer(
                isDesktop: -1,
              ),
            ),
            Container(
              key: _projectsKey,
              child: MyProjects(
                isDesktop: -1,
              ),
            ),
            Container(
              key: _experienceKey,
              child: MyExperience(
                isDesktop: -1,
              ),
            ),
            Container(
              key: _educationKey,
              child: MyEducation(isDesktop: -1),
            ),
            Container(
              key: _contactKey,
              child: const MyContact(isDesktop: -1),
            ),
            //const FunContainer(isDesktop: false),
          ],
        ),
      ),
    );
  }
}
