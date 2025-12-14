import 'package:flutter/material.dart';
import 'package:klevercode_lms/utils/problem_card.dart';
import 'package:klevercode_lms/utils/responsive.dart';

class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);

    final int columns = isDesktop ? 3 : (isTablet ? 2 : 1);
    final double horizontalPadding = isDesktop ? 80 : (isTablet ? 40 : 20);

    final problems = const [
      {
        'icon': Icons.school,
        'title': 'No hands-on projects',
        'desc':
            'Many courses are theory-heavy and don\'t teach building real apps.',
      },
      {
        'icon': Icons.people,
        'title': 'Lack of mentorship',
        'desc': 'Learners need feedback and guidance from experienced mentors.',
      },
      {
        'icon': Icons.work_outline,
        'title': 'Career support missing',
        'desc':
            'Students struggle to transition to real jobs without placement help.',
      },
      {
        'icon': Icons.update,
        'title': 'Outdated curriculum',
        'desc': 'Content often lags behind industry practices and tooling.',
      },
      {
        'icon': Icons.monetization_on,
        'title': 'High costs',
        'desc': 'Quality learning can be expensive and inaccessible.',
      },
      {
        'icon': Icons.schedule,
        'title': 'No flexible schedules',
        'desc': 'Many learners need self-paced options and flexible timelines.',
      },
    ];

    return Container(
      //color: Colors.grey.shade50,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 48,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What learners struggle with',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We built our platform to solve these common problems and help you succeed faster.',
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
                  children: List.generate(problems.length, (index) {
                    final item = problems[index];
                    return SizedBox(
                      width: cardWidth,
                      child: ProblemCard(
                        icon: item['icon'] as IconData,
                        title: item['title'] as String,
                        description: item['desc'] as String,
                      ),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
