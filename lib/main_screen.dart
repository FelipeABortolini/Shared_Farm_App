import 'package:flutter/material.dart';

import 'pages/splash/splash_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SplashPage(),
          ),
        ],
      ),
    );
  }
}
