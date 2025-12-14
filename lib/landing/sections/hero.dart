import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klevercode_lms/utils/hero_illustration.dart';
import 'package:klevercode_lms/utils/hero_text.dart';
import 'package:klevercode_lms/utils/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isMobile = Responsive.isMobile(context);

    final double horizontalPadding = isDesktop
        ? 20.w
        : (isTablet ? 20.w : 15.w);
    final double verticalPadding = isDesktop ? 24.h : 18.h;

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: isDesktop
            ? Center(
                child: Row(
                  children: [
                    // Left: Text content
                    Expanded(flex: 6, child: HeroTextColumn(isDesktop: true)),
                    const SizedBox(width: 40),
                    // Right: Illustration / placeholder
                    Expanded(flex: 5, child: HeroIllustration()),
                  ],
                ),
              )
            : Column(
                children: [
                  // On mobile/tablet show illustration first for a stronger visual
                  SizedBox(
                    height: isMobile ? 220 : 300,
                    child: HeroIllustration(),
                  ),
                  const SizedBox(height: 24),
                  HeroTextColumn(isDesktop: false),
                ],
              ),
      ),
    );
  }
}
