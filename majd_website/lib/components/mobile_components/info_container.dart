import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majd_website/constants/contstant_function.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key, required this.isDesktop});

  final int isDesktop;

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
                padding: EdgeInsets.all(retSize(isDesktop, 30, 15, 10),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, I am",
                          style: GoogleFonts.poppins(
                            fontSize: retSize(isDesktop, 30, 20, 10),
                            color: Colors.deepPurple,
                          ),
                        ),
                        SizedBox(
                          height: retSize(isDesktop, 70, 40, 25),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              RotateAnimatedText(
                                'Majd Issa',
                                textStyle: GoogleFonts.poppins(
                                  fontSize: retSize(isDesktop, 35, 18, 15),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                                duration: const Duration(milliseconds: 2000),
                              ),
                              RotateAnimatedText(
                                'a Software Developer',
                                textStyle: GoogleFonts.poppins(
                                  fontSize: retSize(isDesktop, 35, 18, 15),
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
                            width: retSize(isDesktop, 160, 120, 80),
                            height: retSize(isDesktop, 160, 120, 80),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: 0.2,
                          child: Container(
                            width: retSize(isDesktop, 160, 120, 80),
                            height: retSize(isDesktop, 160, 120, 80),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: 0,
                          child: Container(
                            width: retSize(isDesktop, 160, 120, 80),
                            height: retSize(isDesktop, 160, 120, 80),
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
              SizedBox(height: retSize(isDesktop, 15, 12, 8)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Software Engineer with a Bachelor of Information Technology, majoring in Software Technology, from Macquarie University. Experienced in full-stack development with expertise in Java, Python, JavaScript, SQL, Spring Boot, Node.js, PostgreSQL, and MongoDB. Skilled in building scalable microservices, RESTful APIs, and cloud-based applications (AWS, Azure). Passionate about optimizing backend performance, automating CI/CD pipelines, and developing data-driven solutions to solve complex problems.",
                  style: GoogleFonts.poppins(
                    fontSize: retSize(isDesktop, 15, 12, 8),
                    color: Colors.deepPurple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: retSize(isDesktop, 20, 10, 7)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Here are some of the magic wands I use to create awesome things:',
                  style: GoogleFonts.poppins(
                    fontSize: retSize(isDesktop, 18, 12, 8),
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
                    width: retSize(isDesktop, 40, 30, 14),
                    height: retSize(isDesktop, 40, 30, 14),
                  ),
                  SizedBox(width: 20), // Space between icons
                  // JavaScript Icon
                  Image.asset(
                    'assets/images/js.png',
                    width: retSize(isDesktop, 40, 30, 14),
                    height: retSize(isDesktop, 40, 30, 14),
                  ),
                  SizedBox(width: 20), // Space between icons
                  // CSS Icon
                  Image.asset(
                    'assets/images/css.png',
                    width: retSize(isDesktop, 40, 30, 14),
                    height: retSize(isDesktop, 40, 30, 14),
                  ),
                  SizedBox(width: 20), // Space between icons
                  // HTML Icon
                  Image.asset(
                    'assets/images/html.png',
                    width: retSize(isDesktop, 40, 15, 14),
                    height: retSize(isDesktop, 40, 15, 14),
                  ),
                  SizedBox(width: 20), // Space between icons
                  // Flutter Icon
                  Image.asset(
                    'assets/images/flutter.png',
                    width: retSize(isDesktop, 40, 15, 14),
                    height: retSize(isDesktop, 40, 15, 14),
                  ),
                  SizedBox(width: 20), // Space between icons
                  // Python Icon
                  Image.asset(
                    'assets/images/python.png',
                    width: retSize(isDesktop, 40, 15, 14),
                    height: retSize(isDesktop, 40, 15, 14),
                  ),
                  SizedBox(width: 20), // Space between icons
                  // MongoDB Icon
                  Image.asset(
                    'assets/images/mongo.png',
                    width: retSize(isDesktop, 40, 15, 14),
                    height: retSize(isDesktop, 40, 15, 14),
                  ),
                  SizedBox(width: 20), // Space between icons
                  // PostgreSQL Icon
                  Image.asset(
                    'assets/images/postgresql.png',
                    width: retSize(isDesktop, 40, 15, 14),
                    height: retSize(isDesktop, 40, 15, 14),
                  ),
                  SizedBox(width: 20), // Space between icons
                  // MySQL Icon
                  Image.asset(
                    'assets/images/mysql.png',
                    width: retSize(isDesktop, 40, 15, 14),
                    height: retSize(isDesktop, 40, 15, 14),
                  ),
                ],
              ),
              SizedBox(height: retSize(isDesktop, 15, 10, 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: retSize(isDesktop, 30, 20, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            FadeAnimatedText(
                              'High Distinction',
                              textStyle: GoogleFonts.poppins(
                                fontSize: retSize(isDesktop, 16, 12, 8),
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
                                fontSize: retSize(isDesktop, 16, 12, 8),
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
                                fontSize: retSize(isDesktop, 16, 12, 8),
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
