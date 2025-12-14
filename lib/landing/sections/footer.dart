import 'package:flutter/material.dart';
import 'package:klevercode_lms/utils/responsive.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTop(context, isMobile, isTablet),
              const SizedBox(height: 24),
              const Divider(color: Colors.white24, thickness: 0.5),
              const SizedBox(height: 12),
              _buildBottom(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTop(BuildContext context, bool isMobile, bool isTablet) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _brand(),
          const SizedBox(height: 16),
          _newsletter(context),
          const SizedBox(height: 16),
          _linksColumn('Product', ['Features', 'Pricing', 'Integrations']),
          const SizedBox(height: 12),
          _linksColumn('Company', ['About', 'Careers', 'Contact']),
          const SizedBox(height: 12),
          _socialRow(),
        ],
      );
    }

    // Tablet: two columns; Desktop: four columns
    final int columns = isTablet ? 2 : 4;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          runSpacing: 16,
          spacing: 16,
          children: [
            SizedBox(
              width: _colWidth(constraints.maxWidth, columns),
              child: _brand(),
            ),
            SizedBox(
              width: _colWidth(constraints.maxWidth, columns),
              child: _newsletter(context),
            ),
            SizedBox(
              width: _colWidth(constraints.maxWidth, columns),
              child: _linksColumn('Product', [
                'Features',
                'Pricing',
                'Integrations',
              ]),
            ),
            SizedBox(
              width: _colWidth(constraints.maxWidth, columns),
              child: _linksColumn('Company', ['About', 'Careers', 'Contact']),
            ),
          ],
        );
      },
    );
  }

  double _colWidth(double maxWidth, int columns) =>
      (maxWidth - (16 * (columns - 1))) / columns;

  Widget _brand() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'KleverCode',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Empowering educators with practical, hands-on learning.',
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _newsletter(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Stay updated',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        const Text(
          'Subscribe to receive product updates and teaching resources.',
          style: TextStyle(color: Colors.white70, fontSize: 13),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 44,
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Your email',
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 15),
                    filled: true,
                    fillColor: Colors.white10,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: () {
                  // placeholder: wire subscription action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Subscribed (demo)')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('Subscribe'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _linksColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        for (final l in links)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(l, style: const TextStyle(color: Colors.white70)),
          ),
      ],
    );
  }

  Widget _socialRow() {
    return Row(
      children: [
        _socialIcon(Icons.facebook),
        const SizedBox(width: 8),
        _socialIcon(Icons.facebook),
        const SizedBox(width: 8),
        _socialIcon(Icons.facebook),
        const SizedBox(width: 8),
        _socialIcon(Icons.mail_outline),
      ],
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '© ${DateTime.now().year} KleverCode. All rights reserved.',
            style: const TextStyle(color: Colors.white70),
          ),
        ),
        Row(
          children: [
            Text('Privacy', style: const TextStyle(color: Colors.white70)),
            const SizedBox(width: 12),
            Text('Terms', style: const TextStyle(color: Colors.white70)),
          ],
        ),
      ],
    );
  }
}
