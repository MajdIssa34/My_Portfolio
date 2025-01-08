import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key, required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(isDesktop ? 30 : 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, I am",
                          style: GoogleFonts.poppins(
                            fontSize: isDesktop ? 28 : 20,
                            color: Colors.deepPurple,
                          ),
                        ),
                        SizedBox(
                          height: isDesktop ? 70 : 40,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              RotateAnimatedText(
                                'Majd Issa',
                                textStyle: GoogleFonts.poppins(
                                  fontSize: isDesktop ? 35 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                                duration: const Duration(milliseconds: 2000),
                              ),
                              RotateAnimatedText(
                                'a Software Developer',
                                textStyle: GoogleFonts.poppins(
                                  fontSize: isDesktop ? 35 : 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple.shade400,
                                ),
                                duration: const Duration(milliseconds: 2000),
                              ),
                            ],
                            repeatForever: true,
                            pause: const Duration(milliseconds: 500),
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.rotate(
                          angle: -0.2,
                          child: Container(
                            width: isDesktop ? 160 : 120,
                            height: isDesktop ? 160 : 120,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: 0.2,
                          child: Container(
                            width: isDesktop ? 160 : 120,
                            height: isDesktop ? 160 : 120,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: 0,
                          child: Container(
                            width: isDesktop ? 160 : 120,
                            height: isDesktop ? 160 : 120,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade300,
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/Majd.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: isDesktop ? 15 : 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Motivated and skilled software developer with a Bachelor of Information Technology, majoring in Software Technology, from Macquarie University. Experienced in full-stack development with proficiency in Java, JavaScript, HTML, CSS, Spring Boot, PostgreSQL, MongoDB, and Flutter. Adept at developing cross-platform applications, backend systems, and data-driven solutions. Passionate about building efficient, scalable systems and continuously adapting to new technologies and challenges. Ready to contribute and support any technology team with a versatile skill set and problem-solving approach.",
                  style: GoogleFonts.poppins(
                    fontSize: isDesktop ? 16 : 12,
                    color: Colors.deepPurple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: isDesktop ? 20 : 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Here are some of the magic wands I use to create awesome things:',
                  style: GoogleFonts.poppins(
                    fontSize: isDesktop ? 18 : 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade600,
                  ),
                  textAlign: TextAlign.center,
                ),              
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Java Icon
                  Image.asset(
                    'assets/images/java.png',
                    width: isDesktop ? 40 : 30,
                    height: isDesktop ? 40 : 30,
                  ),
                  SizedBox(width: 20), // Space between icons
                  // JavaScript Icon
                  Image.asset(
                    'assets/images/js.png',
                    width: isDesktop ? 40 : 30,
                    height: isDesktop ? 40 : 30,
                  ),
                  SizedBox(width: 20), // Space between icons
                  // CSS Icon
                  Image.asset(
                    'assets/images/css.png',
                    width: isDesktop ? 40 : 30,
                    height: isDesktop ? 40 : 30,
                  ),
                  SizedBox(width: 20), // Space between icons
                  // HTML Icon
                  Image.asset(
                    'assets/images/html.png',
                    width: isDesktop ? 40 : 30,
                    height: isDesktop ? 40 : 30,
                  ),
                  SizedBox(width: 20), // Space between icons
                  // Flutter Icon
                  Image.asset(
                    'assets/images/flutter.png',
                    width: isDesktop ? 40 : 30,
                    height: isDesktop ? 40 : 30,
                  ),
                  SizedBox(width: 20), // Space between icons
                  // Python Icon
                  Image.asset(
                    'assets/images/python.png',
                    width: isDesktop ? 40 : 30,
                    height: isDesktop ? 40 : 30,
                  ),
                  SizedBox(width: 20), // Space between icons
                  // MongoDB Icon
                  Image.asset(
                    'assets/images/mongo.png',
                    width: isDesktop ? 40 : 30,
                    height: isDesktop ? 40 : 30,
                  ),
                  SizedBox(width: 20), // Space between icons
                  // PostgreSQL Icon
                  Image.asset(
                    'assets/images/postgresql.png',
                    width: isDesktop ? 40 : 30,
                    height: isDesktop ? 40 : 30,
                  ),
                  SizedBox(width: 20), // Space between icons
                  // MySQL Icon
                  Image.asset(
                    'assets/images/mysql.png',
                    width: isDesktop ? 40 : 30,
                    height: isDesktop ? 40 : 30,
                  ),
                ],
              ),
              SizedBox(height: isDesktop ? 15 : 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: isDesktop ? 30 : 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            FadeAnimatedText(
                              'High Distinction',
                              textStyle: GoogleFonts.poppins(
                                fontSize: isDesktop ? 16 : 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                              duration: const Duration(milliseconds: 2000),
                            ),
                          ],
                          repeatForever: true,
                          pause: const Duration(milliseconds: 500),
                        ),
                        SizedBox(width: 20),
                        AnimatedTextKit(
                          animatedTexts: [
                            FadeAnimatedText(
                              'WAM : 87',
                              textStyle: GoogleFonts.poppins(
                                fontSize: isDesktop ? 16 : 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                              duration: const Duration(milliseconds: 2000),
                            ),
                          ],
                          repeatForever: true,
                          pause: const Duration(milliseconds: 500),
                        ),
                        SizedBox(width: 20),
                        AnimatedTextKit(
                          animatedTexts: [
                            FadeAnimatedText(
                              'Dean\'s List',
                              textStyle: GoogleFonts.poppins(
                                fontSize: isDesktop ? 16 : 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                              duration: const Duration(milliseconds: 2000),
                            ),
                          ],
                          repeatForever: true,
                          pause: const Duration(milliseconds: 500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
