import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klevercode_lms/utils/custom_animation_button.dart';
import 'package:klevercode_lms/utils/responsive.dart';

class CustomAppBar extends StatelessWidget {
  final BuildContext bContext;
  const CustomAppBar({super.key, required this.bContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      height: 90.h,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.3), width: 0.5),
        ),
      ),
      child: Responsive.isDesktop(context)
          ? Row(
              children: [
                Text(
                  'KleverCode',
                  style: TextStyle(color: Colors.white, fontSize: 7.sp),
                ),

                SizedBox(width: 8.w),
                Column(
                  children: [
                    SizedBox(height: 30.h),
                    Expanded(
                      child: VerticalDivider(
                        color: Colors.white.withOpacity(0.3),
                        thickness: 0.5,
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
                SizedBox(width: 30.h),
                // Make nav items expand and center, pushing login/actions to the end
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomAnimationButton(
                        text: 'Home',
                        onPressed: () {},
                        index: 0,
                      ),
                      SizedBox(width: 10.w),
                      CustomAnimationButton(
                        text: 'Features',
                        onPressed: () {},
                        index: 1,
                      ),
                      SizedBox(width: 10.w),
                      CustomAnimationButton(
                        text: 'Pricing',
                        onPressed: () {},
                        index: 2,
                      ),
                      SizedBox(width: 10.w),
                      CustomAnimationButton(
                        text: 'Contact',
                        onPressed: () {},
                        index: 3,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 6.sp),
                ),
                SizedBox(width: 10.w),
                ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    side: BorderSide(color: Colors.white),
                    backgroundColor: Colors.black,
                    fixedSize: Size(50.sp, 8.sp),
                  ),
                  child: Text(
                    "Request a Demo",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 4.sp,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              //mainAxisSize: MainAxisSize.min,
              children: [
                // Use the animated menu button that shows the overlay menu
                Builder(
                  builder: (bContext) => IconButton(
                    onPressed: () {
                      Scaffold.of(bContext).openDrawer();
                    },
                    icon: Icon(Icons.menu),
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Text(
                    'KleverCode',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Responsive.isMobile(context) ? 20 : 24,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
