import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ringo_test/core/extensions/context_extension.dart';
import 'package:ringo_test/core/extensions/num_extensions.dart';
import 'package:ringo_test/core/resources/resources.dart';

import '../../../core/constants/app_colors.dart';
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
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome Team Ringo',style: context.textTheme.headlineLarge?.copyWith(color: Colors.white),),
          16.space,
          Text.rich(
              style: context.textTheme.titleLarge?.copyWith(color: Colors.white),
              TextSpan(children: [
            TextSpan(text: 'My Name is : '),
            TextSpan(text: 'Anas Abd Elazim',style: context.textTheme.headlineLarge?.copyWith(color: AppColors.fireColor)),
          ])),
          8.space,
          Text('And Here is my work',style: context.textTheme.titleLarge?.copyWith(color: Colors.white),),
         8.space,
          Text('anasabdelazim602@gmail.com',style: context.textTheme.titleLarge?.copyWith(color: Colors.white),),

          Center(
            child: Lottie.asset(LottieAssets.loading,),
          ),
        ],
      ),
    );
  }
}
