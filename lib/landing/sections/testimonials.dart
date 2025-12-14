import 'package:flutter/material.dart';
import 'package:klevercode_lms/utils/responsive.dart';
import 'package:klevercode_lms/utils/testimonial_card.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final PageController _pageController = PageController(viewportFraction: 0.92);
  int _activePage = 0;

  final List<Map<String, String>> _testimonials = const [
    {
      'quote': 'KleverCode helped our team reduce onboarding time by 60%.',
      'name': 'Aisha Khan',
      'role': 'Head of Learning',
    },
    {
      'quote': 'The lessons are practical and hands-on — students love them.',
      'name': 'Daniel Park',
      'role': 'Course Instructor',
    },
    {
      'quote': 'Support is responsive and features ship fast.',
      'name': 'Monica Reyes',
      'role': 'Product Manager',
    },
    {
      'quote':
          'Our completion rates improved significantly after adopting the platform.',
      'name': 'Liam O\'Connor',
      'role': 'Director of Education',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final int page = _pageController.page?.round() ?? 0;
      if (page != _activePage) {
        setState(() => _activePage = page);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What our users say',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Real feedback from educators and learners using KleverCode.',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 24),
              if (isMobile)
                _buildMobileCarousel(context)
              else
                _buildGrid(context, isTablet),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileCarousel(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _testimonials.length,
            itemBuilder: (context, index) {
              final item = _testimonials[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: TestimonialCard(
                  quote: item['quote']!,
                  name: item['name']!,
                  role: item['role']!,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _testimonials.length,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _activePage == i ? 18 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _activePage == i ? Colors.black : Colors.black26,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGrid(BuildContext context, bool isTablet) {
    final int columns = isTablet ? 2 : 3;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2,
      ),
      itemCount: _testimonials.length,
      itemBuilder: (context, index) {
        final item = _testimonials[index];
        return TestimonialCard(
          quote: item['quote']!,
          name: item['name']!,
          role: item['role']!,
        );
      },
    );
  }
}
