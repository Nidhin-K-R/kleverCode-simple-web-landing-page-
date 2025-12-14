import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 600 &&
      MediaQuery.sizeOf(context).width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1100;
}

double responsiveText(
  BuildContext context,
  double mobile,
  double tablet,
  double desktop,
) {
  if (Responsive.isMobile(context)) {
    return mobile;
  } else if (Responsive.isTablet(context)) {
    return tablet;
  } else {
    return desktop;
  }
}

double drawerWidth(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width < 600) {
    return width * 0.8; // Mobile
  } else if (width < 1100) {
    return 360; // Tablet
  } else {
    return 400; // Desktop (rarely used)
  }
}
