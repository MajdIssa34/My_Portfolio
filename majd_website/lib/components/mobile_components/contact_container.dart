import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:majd_website/constants/contstant_function.dart';
import 'package:majd_website/constants/my_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MyContact extends StatelessWidget {
  const MyContact({super.key, required this.isDesktop});

  final int isDesktop;

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _sendEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'issamajd00@gmail.com',
      query: 'subject=Contacting You&body=Hi Majd,',
    );
    launchUrl(emailLaunchUri);
  }

  Widget contactIcon(String link, String path, String tooltip) {
    return MouseRegion(
      onEnter: (_) => {},
      onExit: (_) => {},
      child: GestureDetector(
        onTap: () => _launchURL(link),
        child: Tooltip(
          message: tooltip,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.shade100,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/$path.png',
              width: retSize(isDesktop, 40, 30, 20),
              height: retSize(isDesktop, 40, 30, 20),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade50,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Get in Touch",
            style: GoogleFonts.poppins(
              fontSize: retSize(isDesktop, 28, 22, 16),
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple.shade900,
            ),
          ),
          const SizedBox(height: 16),
          // Contact Information Card
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Details",
                    style: GoogleFonts.poppins(
                      fontSize: retSize(isDesktop, 22, 18, 12),
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Email:",
                    style: GoogleFonts.poppins(
                      fontSize: retSize(isDesktop, 18, 14, 10),
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: _sendEmail,
                    icon: const Icon(Icons.email_outlined,
                        color: Colors.deepPurple),
                    label: Text(
                      "issamajd00@gmail.com",
                      style: GoogleFonts.poppins(
                        fontSize: retSize(isDesktop, 16, 12, 10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Phone:",
                    style: GoogleFonts.poppins(
                      fontSize: retSize(isDesktop, 18, 14, 10),
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SelectableText(
                    "+61 411 911 174",
                    style: GoogleFonts.poppins(
                      fontSize: retSize(isDesktop, 18, 14, 10),
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Based in Sydney, Australia – Open to Relocation",
                    style: GoogleFonts.poppins(
                      fontSize: retSize(isDesktop, 16, 12, 10),
                      color: Colors.deepPurple.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Social Media Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                contactIcon("https://www.instagram.com/majd_issa34", 'Insta',
                    'Instagram'),
                contactIcon("https://github.com/MajdIssa34", 'Git', 'GitHub'),
                contactIcon(
                  "https://www.linkedin.com/in/majd-issa34/",
                  'Link',
                  'LinkedIn',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Buttons Section
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: retSize(isDesktop, 200, 140, 140),
                  child: MyButton(
                    onTap: () => _launchURL(
                      "https://docs.google.com/document/d/1Ukeb3iDHwKm8kpIMkRkYjJP3-NwlwINKBPpZH6SkqTI/edit?usp=sharing",
                    ),
                    str: "View Resume",
                    isDesktop: isDesktop,
                  ),
                ),
                SizedBox(
                  width: retSize(isDesktop, 12, 6, 2),
                ),
                SizedBox(
                  width: retSize(isDesktop, 200, 140, 140),
                  child: MyButton(
                    onTap: () => _launchURL(
                      "https://drive.google.com/file/d/1vfUfd0ncK-EAxpowCi95YZrUnQWi98JQ/view?usp=sharing",
                    ),
                    str: "View My Transcript",
                    isDesktop: isDesktop,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
