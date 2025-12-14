import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klevercode_lms/providers/app_providers.dart';

class CustomAnimationButton extends ConsumerWidget {
  final String text;
  final VoidCallback onPressed;
  final int index;
  const CustomAnimationButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scroll = ref.watch(AppProviders.scrollProvider);
    final buttonBorder = ref.watch(AppProviders.outlinrButtonProvider);
    final isActive = buttonBorder == index;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          onHover: (value) {
            ref.read(AppProviders.outlinrButtonProvider.notifier).state = value
                ? index
                : -1;
          },

          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
              color: scroll ? Colors.grey[800] : Colors.white,
              fontSize: 6.sp,
            ),
          ),
        ),
        SizedBox(height: 4),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: 2,
          width: isActive ? 30 : 0,
          color: Colors.blue,
        ),
      ],
    );
  }
}
