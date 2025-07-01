import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majd_website/constants/contstant_function.dart';
import 'package:majd_website/constants/my_button.dart';
import 'package:url_launcher/url_launcher.dart';

// A data class to hold project information for better organization.
class Project {
  final String title;
  final String techStack;
  final String description;
  final String link;

  Project({
    required this.title,
    required this.techStack,
    required this.description,
    required this.link,
  });
}

class MyProjects extends StatefulWidget {
  const MyProjects({super.key, required this.isDesktop});

  final int isDesktop;
  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  // === CHANGE 1: The project list has been updated as you requested. ===
  final List<Project> _projects = [
    Project(
      title: "XLinkify - Social Media Platform",
      techStack: "Backend: Express.js, Node.js, MongoDB | Frontend: Flutter",
      description: "A full-stack social media platform handling 100+ API requests/sec with 99.99% uptime.",
      link: "https://xlinkify.com",
    ),
    Project(
      title: "GymTrack - Gym Tracking API",
      techStack: "Backend: Java, Spring Boot, Hibernate, MySQL | Frontend: Flutter",
      description: "High-performance gym tracking system processing 52+ API requests/sec with 0% failure rate.",
      link: "https://github.com/MajdIssa34/Gym-Tracking",
    ),
    Project(
      title: "Advanced Inventory Management System",
      techStack: "Java, Spring Boot, PostgreSQL, Docker, AWS",
      description: "A robust, scalable inventory system to optimize stock levels, track goods in real-time, and automate reordering.",
      link: "https://github.com/MajdIssa34", // Placeholder link
    ),
  ];

  // Controller and state for the mobile PageView
  late PageController _pageController;
  double _currentIndex = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      if(mounted) {
        setState(() {
          _currentIndex = _pageController.page!;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/ExpBack.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: widget.isDesktop == 1 ? _buildDesktopView() : _buildMobileView(),
    );
  }

  /// Builds the desktop layout with a grid of interactive cards.
  Widget _buildDesktopView() {
    return Column(
      children: [
        Text(
          "My Projects",
          style: GoogleFonts.poppins(
            fontSize: retSize(widget.isDesktop, 26, 18, 14),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: _projects.map((project) {
            return ProjectCard(project: project, isDesktop: widget.isDesktop);
          }).toList(),
        ),
      ],
    );
  }

  /// Builds the mobile layout with the PageView scroller.
  Widget _buildMobileView() {
    return Column(
      children: [
        Text(
          "My Projects",
          style: GoogleFonts.poppins(
            fontSize: retSize(widget.isDesktop, 26, 18, 12),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: retSize(widget.isDesktop, 10, 5, 2)),
        SizedBox(
          height: retSize(widget.isDesktop, 300, 240, 200),
          child: PageView(
            controller: _pageController,
            children: _projects.map((p) => _displayProjectPage(p)).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: retSize(widget.isDesktop, 150, 100, 75),
                child: MyButton(
                    onTap: () {
                      if (_currentIndex > 0) {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      }
                    },
                    str: "Previous",
                    isDesktop: widget.isDesktop),
              ),
              SizedBox(
                width: retSize(widget.isDesktop, 150, 100, 75),
                child: MyButton(
                    onTap: () {
                      if (_currentIndex < _projects.length - 1) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      }
                    },
                    str: "Next",
                    isDesktop: widget.isDesktop),
              )
            ],
          ),
        ),
        DotsIndicator(
          dotsCount: _projects.length,
          position: _currentIndex,
          decorator: const DotsDecorator(
            activeColor: Colors.white,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }

  Widget _displayProjectPage(Project project) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  project.title,
                  textAlign: TextAlign.center,
                  textStyle: GoogleFonts.poppins(
                    fontSize: retSize(widget.isDesktop, 26, 18, 12),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true,
              pause: const Duration(milliseconds: 1000),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            project.techStack,
            style: GoogleFonts.poppins(
              fontSize: retSize(widget.isDesktop, 18, 13, 9),
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            project.description,
            style: GoogleFonts.poppins(
              fontSize: retSize(widget.isDesktop, 16, 12, 8),
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          SizedBox(
            child: MyButton(
              onTap: () => _launchURL(project.link),
              str: "View Project",
              isDesktop: widget.isDesktop,
            ),
            width: retSize(widget.isDesktop, 250, 150, 120),
          ),
        ],
      ),
    );
  }
}

// Card for the DESKTOP view
class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.isDesktop,
  });

  final Project project;
  final int isDesktop;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -8, 0))
            : Matrix4.identity(),
        width: 374,
        height: 250,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.6),
                blurRadius: 20,
                spreadRadius: 2,
              )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              child: Stack(
                children: [
                  // This is the content that's always visible.
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.project.title,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.project.techStack,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // === CHANGE 2: This is the overlay that appears on hover. ===
                  // It now has a solid dark background color to hide the text behind it.
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _isHovered ? 1.0 : 0.0,
                    child: Container(
                      // This solid color ensures the text behind is hidden.
                      color: const Color(0xFF1A1A2E).withOpacity(0.95),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.project.description,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: MyButton(
                              onTap: () => _launchURL(widget.project.link),
                              str: "View Project",
                              isDesktop: widget.isDesktop,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}