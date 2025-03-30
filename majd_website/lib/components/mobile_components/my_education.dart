import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majd_website/constants/contstant_function.dart';

class MyEducation extends StatelessWidget {
  const MyEducation({super.key, required this.isDesktop});

  final int isDesktop;

  Widget educationCard({
    required String degree,
    required String university,
    required String years,
    required String achievements,
    required List<String> courses,
    required String iconPath,
  }) {
    return Card(
      color: Colors.white54,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        degree,
                        style: GoogleFonts.poppins(
                          fontSize: retSize(isDesktop, 22, 16, 10),
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text(
                        university,
                        style: GoogleFonts.poppins(
                          fontSize: retSize(isDesktop, 18, 14, 8),
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text(
                        years,
                        style: GoogleFonts.poppins(
                          fontSize: retSize(isDesktop, 16, 12, 8),
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Image.asset(
                  iconPath,
                  width: retSize(isDesktop, 120, 55, 0),
                  height: retSize(isDesktop, 120, 55, 0),
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Achievements:",
              style: GoogleFonts.poppins(
                fontSize: retSize(isDesktop, 18, 14, 8),
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Text(
              achievements,
              style: GoogleFonts.poppins(
                fontSize: retSize(isDesktop, 16, 12, 8),
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Notable Courses:",
              style: GoogleFonts.poppins(
                fontSize: retSize(isDesktop, 18, 14, 8),
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: courses
                  .map(
                    (course) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_outline,
                              size: 16, color: Colors.deepPurple),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              course,
                              style: GoogleFonts.poppins(
                                fontSize: retSize(isDesktop, 16, 12, 8),
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/ConBack.jpg'),
          fit: BoxFit.cover,
          opacity: 0.8,
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "My Education",
            style: GoogleFonts.poppins(
              fontSize: retSize(isDesktop, 28, 22, 16),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          educationCard(
            degree: "Bachelor of Information Technology",
            university: "Macquarie University, Australia",
            years: "Jul 2022 – Feb 2025",
            achievements:
                "- Graduated with High Distinction (WAM: 87.0)\n- Dean's List (Every Semester)\n- Macquarie Univeristy Academic Excellence Award",
            courses: [
              "Object-Oriented Programming Practices",
              "Data Science",
              "Computer Networks",
              "Mobile Application Development",
              "Programming Languages",
            ],
            iconPath: "assets/images/MQ.png", // Macquarie University logo
          ),
          educationCard(
            degree: "Bachelor of Computer Engineering (1 Year Only)",
            university: "Holy Spirit University of Kaslik, Lebanon",
            years: "Jul 2021 – Jun 2022",
            achievements: "- Completed 1 year with GPA: 3.4/4.0",
            courses: [
              "Calculus I, II, III",
              "Algebra I, II",
              "Data Structures and Algorithms",
              "Logic Design",
            ],
            iconPath: "assets/images/Usek.png", // USEK logo
          ),
        ],
      ),
    );
  }
}
