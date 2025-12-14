import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  final BuildContext bContext;
  const DrawerScreen({super.key, required this.bContext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 55, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Builder(
              builder: (bContext) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(bContext).closeDrawer();
                  },
                  icon: Icon(
                    Icons.close_fullscreen_rounded,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 50),
          TextButton(
            onPressed: () {},
            child: Text(
              'Home',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: Text(
              'Features',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: Text(
              'Pricing',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: Text(
              'Contact',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
