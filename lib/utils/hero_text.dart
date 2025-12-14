import 'package:flutter/material.dart';
import 'package:klevercode_lms/utils/responsive.dart';

class HeroTextColumn extends StatelessWidget {
  final bool isDesktop;

  const HeroTextColumn({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final double titleSize = isDesktop ? 44 : 28;
    final double subtitleSize = isDesktop ? 18 : 14;

    return LayoutBuilder(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text(
            'Learn. Build. Launch.',
            style: TextStyle(
              color: Colors.white,
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Interactive courses, hands-on projects, and expert mentors to accelerate your tech career.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: subtitleSize,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          // Wrap(
          //   spacing: 12,
          //   runSpacing: 8,
          //   crossAxisAlignment: WrapCrossAlignment.center,

          //   children: [Respons],
          // ),
          constraints.maxWidth <= 285
              ? Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 20,
                        //   vertical: 14,
                        // ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white54),
                        foregroundColor: Colors.white,
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 20,
                        //   vertical: 14,
                        // ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Request Demo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              : Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,

                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 20,
                        //   vertical: 14,
                        // ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white54),
                        foregroundColor: Colors.white,
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 20,
                        //   vertical: 14,
                        // ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Request Demo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 38),
          Responsive.isMobile(context)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '100k+ learners',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 16),
                    Icon(Icons.verified, color: Colors.blueAccent, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Top industry mentors',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '100k+ learners',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.verified, color: Colors.blueAccent, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Top industry mentors',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
