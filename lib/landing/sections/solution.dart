import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klevercode_lms/utils/responsive.dart';
import 'package:klevercode_lms/utils/solution_card.dart';

class SolutionSection extends StatelessWidget {
  const SolutionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);

    final double horizontalPadding = isDesktop ? 80 : (isTablet ? 40 : 20);

    final solutions = const [
      {
        'icon': Icons.play_circle_fill,
        'title': 'Project-first curriculum',
        'desc': 'Build real products with guided milestones and code reviews.',
      },
      {
        'icon': Icons.person_search,
        'title': '1:1 Mentorship',
        'desc': 'Get personalized feedback from industry mentors.',
      },
      {
        'icon': Icons.cases_outlined,
        'title': 'Career Toolkit',
        'desc': 'Interview prep, portfolios, and placement support.',
      },
      {
        'icon': Icons.update_rounded,
        'title': 'Always up-to-date',
        'desc': 'Curriculum continuously updated to match industry needs.',
      },
      {
        'icon': Icons.attach_money,
        'title': 'Affordable Plans',
        'desc': 'Flexible pricing and scholarships to increase access.',
      },
      {
        'icon': Icons.schedule_send,
        'title': 'Flexible pacing',
        'desc': 'Self-paced options plus cohort-based learning.',
      },
    ];

    final int columns = isDesktop ? 3 : (isTablet ? 2 : 1);

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 48,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: Column(
          crossAxisAlignment: Responsive.isMobile(context)
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            const Text(
              'How we help learners succeed',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A set of practical solutions built to remove barriers and accelerate career growth.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                final double spacing = 16;
                final double cardWidth =
                    (constraints.maxWidth - spacing * (columns - 1)) / columns;

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: List.generate(solutions.length, (index) {
                    final item = solutions[index];
                    return SizedBox(
                      width: cardWidth,
                      child: SolutionCard(
                        icon: item['icon'] as IconData,
                        title: item['title'] as String,
                        description: item['desc'] as String,
                      ),
                    );
                  }),
                );
              },
            ),
            const SizedBox(height: 28),
            // CTA row
            Responsive.isMobile(context)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Explore Courses'),
                      ),
                      SizedBox(height: 12.h),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Colors.white.withOpacity(0.1),
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Request Demo'),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Explore Courses'),
                      ),
                      SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Colors.white.withOpacity(0.1),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Request Demo'),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
