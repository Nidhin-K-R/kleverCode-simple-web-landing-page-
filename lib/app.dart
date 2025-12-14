import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klevercode_lms/landing/landing_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: ScreenUtil.defaultSize,
        builder: (context, child) =>
            MaterialApp(debugShowCheckedModeBanner: false, home: LandingPage()),
      ),
    );
  }
}
