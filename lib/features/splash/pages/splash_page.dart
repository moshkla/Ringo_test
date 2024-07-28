import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ringo_test/core/resources/resources.dart';

import '../bloc/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    SplashCubit.to.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(LottieAssets.loading),
      ),
    );
  }
}
