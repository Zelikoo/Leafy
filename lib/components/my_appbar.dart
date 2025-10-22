import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xfffaf2e4),

      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: Image(
              image: AssetImage("assets/images/leafy.png"),
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "Leafy",
            style: TextStyle(
              fontFamily: 'AlexBrush',
              fontSize: 50,
              color: Color(0xff097782),
            ),
          ),
        ],
      ),
    );
  }
}
