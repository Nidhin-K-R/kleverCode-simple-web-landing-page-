import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:klevercode_lms/landing/sections/app_bar.dart';
import 'package:klevercode_lms/landing/sections/faq.dart';
import 'package:klevercode_lms/landing/sections/features.dart';
import 'package:klevercode_lms/landing/sections/footer.dart';
import 'package:klevercode_lms/landing/sections/hero.dart';
import 'package:klevercode_lms/landing/sections/how_it_works.dart';
import 'package:klevercode_lms/landing/sections/pricing.dart';
import 'package:klevercode_lms/landing/sections/problem.dart';
import 'package:klevercode_lms/landing/sections/solution.dart';
import 'package:klevercode_lms/landing/sections/testimonials.dart';
import 'package:klevercode_lms/providers/app_providers.dart';
import 'package:klevercode_lms/screens/mobile/drawer_screen.dart';
import 'package:klevercode_lms/utils/responsive.dart';

class MobileLayout extends ConsumerWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();
    final scroll = ref.watch(AppProviders.scrollProvider);
    scrollController.addListener(() {
      if (scrollController.offset > 50 && !scroll) {
        ref.read(AppProviders.scrollProvider.notifier).state = true;
      } else if (scrollController.offset < 50 && scroll) {
        ref.read(AppProviders.scrollProvider.notifier).state = false;
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        width: drawerWidth(context),
        child: DrawerScreen(bContext: context),
      ),

      body: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        thickness: 15,
        child: SingleChildScrollView(
          controller: scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomAppBar(bContext: context),
              SizedBox(height: 40),
              HeroSection(),
              SizedBox(height: 30),
              ProblemSection(),
              SolutionSection(),
              FeaturesSection(),
              HowItWorksSection(),
              TestimonialsSection(),
              PricingSection(),
              FAQSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
