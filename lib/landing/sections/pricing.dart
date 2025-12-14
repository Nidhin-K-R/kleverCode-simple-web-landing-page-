import 'package:flutter/material.dart';
import 'package:klevercode_lms/utils/pricing_card.dart';
import 'package:klevercode_lms/utils/responsive.dart';

class PricingSection extends StatefulWidget {
  const PricingSection({super.key});

  @override
  State<PricingSection> createState() => _PricingSectionState();
}

class _PricingSectionState extends State<PricingSection> {
  bool yearly = false;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isMobile = Responsive.isMobile(context);

    final double horizontalPadding = isDesktop ? 80 : (isTablet ? 40 : 20);

    final plans = [
      {
        'title': 'Starter',
        'priceMonthly': 0,
        'priceYearly': 0,
        'features': [
          'Access to free courses',
          'Community support',
          'Limited time',
        ],
        'popular': false,
      },
      {
        'title': 'Pro',
        'priceMonthly': 29,
        'priceYearly': 290,
        'features': [
          'All Starter features',
          'Projects & code reviews',
          'Mentor sessions',
        ],
        'popular': true,
      },
      {
        'title': 'Enterprise',
        'priceMonthly': 99,
        'priceYearly': 990,
        'features': ['Team seats', 'Dedicated mentor', 'Hiring support'],
        'popular': false,
      },
    ];

    final int columns = isDesktop ? 3 : (isTablet ? 2 : 1);

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 56,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pricing',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Simple pricing that scales with your learning goals.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // ✅ FIXED RESPONSIVE BILLING TOGGLE
            Align(
              alignment: isMobile ? Alignment.center : Alignment.centerLeft,
              child: _billingToggle(isMobile),
            ),

            const SizedBox(height: 24),

            LayoutBuilder(
              builder: (context, constraints) {
                const double spacing = 16;
                final double cardWidth =
                    (constraints.maxWidth - spacing * (columns - 1)) / columns;

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: List.generate(plans.length, (index) {
                    final p = plans[index];
                    final int price = yearly
                        ? p['priceYearly'] as int
                        : p['priceMonthly'] as int;

                    final String priceLabel = price == 0
                        ? 'Free'
                        : (yearly ? '\$ $price/yr' : '\$ $price/mo');

                    return SizedBox(
                      width: cardWidth,
                      child: PricingCard(
                        title: p['title'] as String,
                        priceLabel: priceLabel,
                        features: p['features'] as List<String>,
                        popular: p['popular'] as bool,
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

  /// ✅ Responsive billing toggle widget
  Widget _billingToggle(bool isMobile) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 12,
      runSpacing: 8,
      children: [
        const Text('Billing:', style: TextStyle(color: Colors.white)),
        SizedBox(
          height: 40,
          child: ToggleButtons(
            isSelected: [!yearly, yearly],
            onPressed: (index) {
              setState(() {
                yearly = index == 1;
              });
            },
            borderRadius: BorderRadius.circular(8),
            constraints: const BoxConstraints(minHeight: 36, minWidth: 90),
            selectedColor: Colors.white,
            fillColor: Colors.blue,
            color: Colors.white,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Monthly',
                  style: TextStyle(fontSize: isMobile ? 13 : 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Yearly',
                  style: TextStyle(fontSize: isMobile ? 13 : 14),
                ),
              ),
            ],
          ),
        ),
        if (yearly)
          const Text(
            'Save 20%',
            style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
