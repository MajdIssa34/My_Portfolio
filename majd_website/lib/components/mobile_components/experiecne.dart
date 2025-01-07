import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyExperience extends StatelessWidget {
  final List<Experience> experiences = [
    Experience(
      title: "Intern at Macquarie University",
      date: "Jan 2023 - Jul 2023",
      responsibilities: [        
        "Improved engagement by 40% and reduced website load times by 35% through optimized algorithms",
        "Developed an interactive website guiding over 5,000 students in selecting academic majors.",
        "Achieved a 95% positive feedback score from usability testing with students and staff.",
        "Improved engagement by 40% and reduced website load times by 35% throughoptimized algorithms.",
      ],
    ),
    Experience(
      title: "Shift Manager at ALDI",
      date: "Jan 2023 - Present",
      responsibilities: [
        "Ranked in the top 5% of most efficient ALDI workers in NSW, maintaining Operational Efficiency (OE) above 92% during all shifts.",
        "Managed inventory restocking with 98% accuracy, minimizing stock discrepancies.",
        "Consistently met Key Performance Indicators (KPIs) for sales, cleanliness, and customer experience.",
        "Address and solve customer service issues",
        "Briefed teams on priorities, optimized task assignments, and ensured smooth daily operations."
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