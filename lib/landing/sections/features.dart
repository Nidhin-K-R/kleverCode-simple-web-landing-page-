import 'package:flutter/material.dart';
import 'package:klevercode_lms/utils/feature_tile.dart';
import 'package:klevercode_lms/utils/responsive.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);

    final double horizontalPadding = isDesktop ? 80 : (isTablet ? 40 : 20);

    final features = const [
      {
        'icon': Icons.play_circle_fill,
        'title': 'Hands-on Projects',
        'desc':
            'Learn by building portfolio-ready projects with real-world requirements.',
      },
      {
        'icon': Icons.person,
        'title': 'Mentorship',
        'desc': 'Personalized feedback from industry mentors and code reviews.',
      },
      {
        'icon': Icons.school,
        'title': 'Structured Curriculum',
        'desc': 'Guided paths that structure learning and focus on outcomes.',
      },
      {
        'icon': Icons.group,
        'title': 'Community',
        'desc': 'Active peer community for collaboration and support.',
      },
      {
        'icon': Icons.cases_outlined,
        'title': 'Career Support',
        'desc': 'Interview prep, resume reviews, and hiring assistance.',
      },
      {
        'icon': Icons.update,
        'title': 'Always Updated',
        'desc':
            'Curriculum updated regularly to match industry tools and workflows.',
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
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Platform features',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Everything you need to learn, build, and launch your career.',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                final spacing = 16.0;
                final tileWidth =
                    (constraints.maxWidth - spacing * (columns - 1)) / columns;

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: List.generate(features.length, (index) {
                    final f = features[index];
                    return SizedBox(
                      width: tileWidth,
                      child: FeatureTile(
                        icon: f['icon'] as IconData,
                        title: f['title'] as String,
                        description: f['desc'] as String,
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
