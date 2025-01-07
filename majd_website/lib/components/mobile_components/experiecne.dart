import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyExperience extends StatelessWidget {
  final List<Experience> experiences = [
    Experience(
      title: "Shift Manager at ALDI",
      date: "Jan 2023 - Present",
      responsibilities: [
        "Managed team and operations to ensure efficiency.",
        "Trained new employees.",
        "Handled customer service and resolved issues.",
      ],
    ),
    Experience(
      title: "Intern at Macquarie University",
      date: "Jan 2023 - Jul 2023",
      responsibilities: [        
        "Assisted in research projects and software development.",
        "Contributed to developing educational software tools.",
        "Collaborated with a team to design user-friendly interfaces.",
        "Tested and debugged code to ensure quality.",
      ],
    ),
    Experience(
      title: "Personal Tutor",
      date: "Feb 2018 - Jul 2022",
      responsibilities: [
        "Tutored students in various subjects.",
        "Developed personalized lesson plans.",
        "Assessed student progress and provided feedback.",
        "Helped students prepare for exams and assignments.",
      ],
    ),
  ];
  final bool isDesktop;

  MyExperience({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "My Experience",
            style: GoogleFonts.poppins(
              fontSize: isDesktop ? 26 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return StaggeredExperienceCard(
                experience: experiences[index],
                isDesktop: isDesktop,
                delay: Duration(milliseconds: 200 * index),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Experience {
  final String title;
  final String date;
  final List<String> responsibilities;

  Experience({
    required this.title,
    required this.date,
    required this.responsibilities,
  });
}

class StaggeredExperienceCard extends StatefulWidget {
  final Experience experience;
  final bool isDesktop;
  final Duration delay;

  const StaggeredExperienceCard({
    required this.experience,
    required this.isDesktop,
    required this.delay,
    super.key,
  });

  @override
  State<StaggeredExperienceCard> createState() =>
      _StaggeredExperienceCardState();
}

class _StaggeredExperienceCardState extends State<StaggeredExperienceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withOpacity(0.1),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.experience.title,
                  style: GoogleFonts.poppins(
                    fontSize: widget.isDesktop ? 26 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.experience.date,
                  style: GoogleFonts.poppins(
                    fontSize: widget.isDesktop ? 20 : 14,
                    color: Colors.deepPurple.shade700,
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: Container(),
                  secondChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.experience.responsibilities
                        .map(
                          (responsibility) => Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              "- $responsibility",
                              style: GoogleFonts.poppins(
                                fontSize: widget.isDesktop ? 18 : 12,
                                color: Colors.deepPurple.shade700,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    _isExpanded
                        ? Icons.expand_less
                        : Icons.expand_more,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}