import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MyContact extends StatelessWidget {
  const MyContact({super.key, required this.isDesktop});

  final bool isDesktop;
  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget contactButton(String link, String path) {
    return GestureDetector(
      onTap: () => _launchURL(link),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/$path.png',
              width: isDesktop ? 50 : 35,
            ),
          ),
        ),
      ),
    );
  }

  Widget downloadButton(String text, String link) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL(link),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isDesktop ? 200 : 150,
          height: isDesktop ? 60 : 50,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 20 : 14,
              color: Colors.white,
            ),
          ),
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
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Connect with me",
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 26 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Contact me:",
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 25 : 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SelectableText(
            "issamajd00@gmail.com",
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 25 : 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SelectableText(
            "+61 411 911 174",
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 25 : 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Or socialize with me!?",
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 25 : 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Follow me on Instagram, explore my profile, maybe I'll give you a follow back.",
                      style: GoogleFonts.poppins(
                        fontSize: isDesktop ? 25 : 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  contactButton(
                      "https://www.instagram.com/majd_issa34", 'Insta'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Check out my GitHub, where bugs turn into features.",
                      style: GoogleFonts.poppins(
                        fontSize: isDesktop ? 25 : 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  contactButton("https://github.com/MajdIssa34", 'Git'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Connect with me on LinkedIn, let's be professional acquaintances with a dash of fun!",
                      style: GoogleFonts.poppins(
                        fontSize: isDesktop ? 25 : 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  contactButton(
                      "https://www.linkedin.com/in/majd-issa-652aa725b/",
                      'Link')
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    downloadButton("View Resume",
                        "https://drive.google.com/file/d/1Presq4xtz3qsSodqDCi1ke9BJ4MnXYT-/view?usp=drive_link"),
                    const SizedBox(height: 16),
                    downloadButton("View Transcript",
                        "https://drive.google.com/file/d/1uo3yBnwy_PjgkJ0Sc8BEqq_gD1qbix16/view?usp=sharing"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
