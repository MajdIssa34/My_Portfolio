import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majd_website/components/mobile_components/contact_container.dart';
import 'package:majd_website/components/mobile_components/experiecne.dart';
import 'package:majd_website/components/mobile_components/info_container.dart';
import 'package:majd_website/components/mobile_components/projects_container.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({super.key});

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
        toolbarHeight: 70,
        title: Center(
          child: SizedBox(
            width: 770,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/Logo.png",
                    width: 80,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    _scrollToSection(_infoKey);
                  },
                  child: Text(
                    'Info',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
                      fontSize: 18,
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
                      fontSize: 18,
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
                      fontSize: 18,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.deepPurple.shade100,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: 800,
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            controller: _scrollController,
            children: [
              Container(
                key: _infoKey,
                child: const InfoContainer(isDesktop: true),
              ),
              Container(
                key: _projectsKey,
                child: MyProjects(isDesktop: true),
              ),
              Container(
                key: _experienceKey,
                child: MyExperience(isDesktop: true),
              ),
              Container(
                key: _contactKey,
                child: const MyContact(isDesktop: true),
              ),
              //const FunContainer(isDesktop: true),
            ],
          ),
        ),
      ),
    );
  }
}
