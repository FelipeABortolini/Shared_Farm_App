import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../login/utils/auth_check.dart';

class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return AuthCheck(first: true);
            },
          ),
        ),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            Center(
              child: SizedBox(
                width: 370,
                height: 400,
                child:
                    Lottie.asset('assets/farm.json', height: 130, width: 130),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
