import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key, required this.isDesktop});

  final bool isDesktop;
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
              fontSize: widget.isDesktop ? 26 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: widget.isDesktop ? 370 : 270,
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                displayProject(
                  "Freelancing Platform",
                  "Languages: Java, Frameworks: Spring Boot, Flutter, Database: MongoDB, Frontend: Flutter.",
                  "This project is a Freelancer Search Platform designed to help users find freelancers based on skills, portfolio projects, and ratings. The platform provides a user-friendly interface to search, view, and filter freelancer profiles dynamically.",
                  "https://github.com/MajdIssa34/Freelancing",
                ),
                displayProject(
                  "Diabetes Prediction Analysis.",
                  "Languages: Python, Libraries: NumPy, Pandas, Scikit-learn.",
                  "This project involves analyzing a dataset related to diabetes, aiming to predict whether an individual has diabetes based on various health metrics. The data, sourced from Kaggle, includes measurements such as the number of pregnancies, glucose level, blood pressure, skin thickness, insulin level, body mass index (BMI), diabetes pedigree function, and age.",
                  "https://github.com/MajdIssa34/DiabetesDataset",
                ),
                displayProject(
                  "NBA Stats Web Application.",
                  "Languages: Java, Frameworks: Spring Boot, PostgreSQL, Database: PostgreSQL, Frontend: HTML, CSS, JavaScript.",
                  "This application provides detailed statistics and information about NBA players, offering a variety of filters to search for specific players based on different criteria such as team, position, and performance metrics. The app is powered by a PostgreSQL database, allowing efficient querying and dynamic data management.",
                  "https://github.com/MajdIssa34/NBA_Stats",
                ),
                displayProject(
                    "Employee Management System.",
                    "Languages: JavaScript, Frameworks: Node.js, Express.js, Database: MongoDB, Frontend: HTML, CSS, JavaScript.",
                    "This Employee Management System allows users to add, view, edit, and delete employee records. It features a backend built with Node.js and Express.js, and stores employee data in MongoDB. The frontend is designed using HTML, CSS, and JavaScript, offering a clean interface for managing employees.",
                    "https://github.com/MajdIssa34/Employee-Management-System"),
                displayProject(
                  "Macquarie University Mobile App.",
                  "Languages: Dart, Frameworks: Flutter, Authentication: Firebase.",
                  "This Flutter application is designed to enhance the campus experience for Macquarie University students by providing critical information and interactive features. It includes user authentication, an interactive campus map, a news feed, and a coffee shop interface with a shopping cart and order history functionality.",
                  "https://github.com/MajdIssa34/CampusMobileApp",
                ),
                displayProject(
                  "Java Weather Application.",
                  "Languages: Java, Frameworks: Swing",
                  "WeatherApp is a desktop application developed in Java, utilizing Swing for the GUI. It allows users to enter a city name and retrieve current weather information for that location, including temperature, weather condition, humidity, wind speed, and local time. The application fetches weather data from external APIs and displays it in an easy-to-understand format.",
                  "https://github.com/MajdIssa34/WeatherApp",
                ),
              ],
            ),
          ),
          // Navigation Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _previousPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Button color
                ),
                child: Text(
                  "Previous",
                  style: GoogleFonts.poppins(
                    fontSize: widget.isDesktop ? 26 : 18,
                    //fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Button color
                ),
                child: Text(
                  "Next",
                  style: GoogleFonts.poppins(
                    fontSize: widget.isDesktop ? 26 : 18,
                    //fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          DotsIndicator(
            dotsCount: 6,
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
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Animated Title
          SizedBox(
            height: widget.isDesktop ? 50 : 40, // Consistent height
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  title,
                  textStyle: GoogleFonts.poppins(
                    fontSize: widget.isDesktop ? 26 : 18,
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
          const SizedBox(height: 4),
          // Static Date (unchanged)
          Text(
            date,
            style: GoogleFonts.poppins(
              fontSize: widget.isDesktop ? 22 : 14,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: widget.isDesktop ? 16 : 8),
          // Animated Description
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: widget.isDesktop ? 16 : 12,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: widget.isDesktop ? 16 : 8),
          // Link to View Project
          GestureDetector(
            onTap: () => _launchURL(link),
            child: Text(
              "View Project",
              style: GoogleFonts.poppins(
                fontSize: widget.isDesktop ? 20 : 12,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
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
    if (_currentIndex < 5) {
      // 3 is the last index (as there are 4 items)
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
} 