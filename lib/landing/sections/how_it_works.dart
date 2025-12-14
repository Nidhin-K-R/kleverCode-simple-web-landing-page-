import 'package:flutter/material.dart';
import 'package:klevercode_lms/utils/responsive.dart';
import 'package:klevercode_lms/utils/step_card.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);

    final double horizontalPadding = isDesktop ? 80 : (isTablet ? 40 : 20);

    final steps = const [
      {
        'step': '1',
        'title': 'Choose a path',
        'desc':
            'Pick a track aligned to your career goals with recommended projects.',
        'icon': Icons.track_changes,
      },
      {
        'step': '2',
        'title': 'Build projects',
        'desc': 'Follow guided milestones and submit projects for review.',
        'icon': Icons.build_circle,
      },
      {
        'step': '3',
        'title': 'Get mentored',
        'desc': 'One-on-one feedback and live sessions to accelerate learning.',
        'icon': Icons.person_search,
      },
      {
        'step': '4',
        'title': 'Launch career',
        'desc': 'Interview prep, portfolio reviews and placement support.',
        'icon': Icons.rocket_launch,
      },
    ];

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
              'How it works',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'A simple, proven process that helps you learn by doing and land real jobs.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 24),
            // Desktop: horizontal timeline; Tablet/mobile: stacked
            isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(steps.length, (index) {
                      final item = steps[index];
                      return Expanded(
                        child: StepCard(
                          step: item['step'] as String,
                          title: item['title'] as String,
                          description: item['desc'] as String,
                          icon: item['icon'] as IconData,
                          isLast: index == steps.length - 1,
                        ),
                      );
                    }),
                  )
                : Column(
                    children: List.generate(steps.length, (index) {
                      final item = steps[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: StepCard(
                          step: item['step'] as String,
                          title: item['title'] as String,
                          description: item['desc'] as String,
                          icon: item['icon'] as IconData,
                          isLast: index == steps.length - 1,
                        ),
                      );
                    }),
                  ),
          ],
        ),
      ),
    );
  }
}
