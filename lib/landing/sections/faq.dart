import 'package:flutter/material.dart';
import 'package:klevercode_lms/utils/responsive.dart';

const List<Map<String, String>> _kFaqs = [
  {
    'q': 'How do I get started?',
    'a':
        'Create an account, follow the onboarding checklist, and add your first course.',
  },
  {
    'q': 'Can I import content from other platforms?',
    'a':
        'Yes — we support common formats and provide import helpers for popular LMSs.',
  },
  {
    'q': 'Is there a free trial?',
    'a':
        'We offer a 14-day trial with access to core features so you can evaluate the platform.',
  },
  {
    'q': 'How does pricing work?',
    'a':
        'Pricing is flexible: per-seat, per-course, or enterprise licensing — contact sales for details.',
  },
  {
    'q': 'Do you offer instructor support?',
    'a': 'Yes. Paid plans include priority support and onboarding assistance.',
  },
  {
    'q': 'Can I customize workflows?',
    'a':
        'Workflows are customizable; reach out if you need advanced configuration.',
  },
];

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Frequently asked questions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Quick answers to common questions about the platform.',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              if (isMobile) _buildSingleColumn() else _buildTwoColumns(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSingleColumn() {
    return Column(
      children: _kFaqs.map((f) {
        return Card(
          color: const Color.fromARGB(221, 33, 33, 33),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ExpansionTile(
            title: Text(f['q']!, style: TextStyle(color: Colors.white)),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Text(
                  f['a']!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTwoColumns() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double spacing = 12;
        final double colWidth = (constraints.maxWidth - spacing) / 2;
        return Wrap(
          runSpacing: 12,
          spacing: spacing,
          children: _kFaqs.map((f) {
            return SizedBox(
              width: colWidth,
              child: Card(
                color: const Color.fromARGB(221, 33, 33, 33),
                child: ExpansionTile(
                  title: Text(f['q']!, style: TextStyle(color: Colors.white)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: Text(
                        f['a']!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
