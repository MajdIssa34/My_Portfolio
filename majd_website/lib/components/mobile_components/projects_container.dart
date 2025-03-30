import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majd_website/constants/contstant_function.dart';
import 'package:majd_website/constants/my_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key, required this.isDesktop});

  final int isDesktop;
  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  final PageController _pageController = PageController();
  double _currentIndex = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/ExpBack.jpg"),
          fit: BoxFit.cover,
        ),
        color: Colors.deepPurple.shade100,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "My Projects",
            style: GoogleFonts.poppins(
              fontSize: retSize(widget.isDesktop, 26, 18, 12),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: retSize(widget.isDesktop, 10, 5, 2),
          ),
          SizedBox(
            height: retSize(widget.isDesktop, 300, 240, 150),
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                displayProject(
                  "XLinkify - Social Media Platform",
                  "Backend: Express.js, Node.js, MongoDB | Frontend: Flutter | Hosting: Render, Firebase",
                  "A full-stack social media platform handling 100+ API requests/sec with 99.99% uptime. Features include user authentication (JWT), dynamic feed, and follow system.",
                  "https://xlinkify.com",
                ),
                displayProject(
                  "GymTrack - Gym Tracking API",
                  "Backend: Java, Spring Boot, Hibernate, MySQL | Frontend: Flutter",
                  "High-performance gym tracking system processing 52+ API requests/sec with 0% failure rate. Provides analytics, logging, and trainer monitoring tools.",
                  "https://github.com/MajdIssa34/Gym-Tracking",
                ),
                displayProject(
                  "Freelancing Platform.",
                  "Languages: Java, Frameworks: Spring Boot, Flutter, Database: MongoDB, Frontend: Flutter.",
                  "This platform helps users find freelancers based on skills, portfolios, and ratings. It allows users to search, filter, and view profiles dynamically with an intuitive user interface, making it easy to hire professionals.",
                  "https://github.com/MajdIssa34/Freelancing",
                ),
                displayProject(
                  "Diabetes Prediction Analysis.",
                  "Languages: Python, Libraries: NumPy, Pandas, Scikit-learn.",
                  "This project predicts the likelihood of diabetes based on a dataset containing health metrics such as glucose levels, BMI, and age. Using machine learning models, it helps identify individuals at risk and provides predictions for diagnosis.",
                  "https://github.com/MajdIssa34/DiabetesDataset",
                ),
                displayProject(
                  "NBA Stats Web Application.",
                  "Languages: Java, Frameworks: Spring Boot, PostgreSQL, Database: PostgreSQL, Frontend: HTML, CSS, JavaScript.",
                  "This web app provides detailed statistics on NBA players, allowing users to filter players by team, position, and performance metrics. It uses a PostgreSQL database to efficiently manage and query large datasets for real-time results.",
                  "https://github.com/MajdIssa34/NBA_Stats",
                ),
                displayProject(
                    "Employee Management System.",
                    "Languages: JavaScript, Frameworks: Node.js, Express.js, Database: MongoDB, Frontend: HTML, CSS, JavaScript.",
                    "This system helps manage employee data, including adding, viewing, and editing employee records. Built with Node.js and MongoDB, it provides a clean interface to interact with employee data securely and effectively.",
                    "https://github.com/MajdIssa34/Employee-Management-System"),
                displayProject(
                  "Macquarie University Mobile App.",
                  "Languages: Dart, Frameworks: Flutter, Authentication: Firebase.",
                  "A mobile app for Macquarie University students offering features like campus maps, news feeds, coffee shop menus, and order history. It includes Firebase authentication to provide a personalized user experience.",
                  "https://github.com/MajdIssa34/CampusMobileApp",
                ),
                displayProject(
                  "Java Weather Application.",
                  "Languages: Java, Frameworks: Swing",
                  "This Java-based weather app uses external APIs to provide real-time weather information for cities worldwide. It displays details such as temperature, humidity, and wind speed in an easy-to-understand format with a clean GUI.",
                  "https://github.com/MajdIssa34/WeatherApp",
                ),
              ],
            ),
          ),

          // SizedBox(
          //   height: widget.isDesktop ? 15 : 8,
          // ),
          // Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: MyButton(
                    onTap: _previousPage,
                    str: "Previous",
                    isDesktop: widget.isDesktop),
                width: retSize(widget.isDesktop, 150, 100, 75),
              ),
              SizedBox(
                child: MyButton(
                    onTap: _nextPage, str: "Next", isDesktop: widget.isDesktop),
                width: retSize(widget.isDesktop, 150, 100, 75),
              )
            ],
          ),
          DotsIndicator(
            dotsCount: 8,
            position: _currentIndex,
            decorator: const DotsDecorator(
              activeColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget displayProject(
      String title, String date, String description, String link) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Animated Title
        SizedBox(
          // height:
          //     widget.isDesktop ? 35 : 25, // Consistent height for animation
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                title,
                textStyle: GoogleFonts.poppins(
                  fontSize: retSize(widget.isDesktop, 26, 18, 12),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            repeatForever: true, // Optional: repeat animation
            pause: const Duration(milliseconds: 500),
          ),
        ),
        SizedBox(height: 2),
        // Static Date (unchanged)
        Text(
          date,
          style: GoogleFonts.poppins(
            fontSize: retSize(widget.isDesktop, 18, 13, 10),
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: retSize(widget.isDesktop, 16, 8, 4)),
        // Updated Description (uniform length and size)
        Text(
          description,
          style: GoogleFonts.poppins(
            fontSize: retSize(widget.isDesktop, 16, 12, 7),
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: retSize(widget.isDesktop, 16, 8, 4)),
        // Link to View Project
        SizedBox(
          child: MyButton(
            onTap: () => _launchURL(link),
            str: "View Project",
            isDesktop: widget.isDesktop,
          ),
          width: retSize(widget.isDesktop, 250, 150, 100),
          //height: retSize(widget.isDesktop, 60, 40, 40),
        ),
      ],
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  // Method to navigate to the previous page
  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Method to navigate to the next page
  void _nextPage() {
    if (_currentIndex < 7) {
      // 3 is the last index (as there are 4 items)
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
