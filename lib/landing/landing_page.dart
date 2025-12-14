import 'package:flutter/material.dart';
import 'package:klevercode_lms/screens/desktop/desktop_layout.dart';
import 'package:klevercode_lms/screens/mobile/mobile_layout.dart';
import 'package:klevercode_lms/screens/tablet/tablet_layout.dart';
import 'package:klevercode_lms/utils/responsive.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return MobileLayout();
    } else if (Responsive.isTablet(context)) {
      return TabletLayout();
    } else {
      return DesktopLayout();
    }
  }
}
