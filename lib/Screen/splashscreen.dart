import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_game/Screen/game.dart';
import 'package:tic_tac_toe_game/Screen/login.dart';
import 'package:tic_tac_toe_game/helper/helper_fuction.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  nextScreen() {
    final username = HelperFuctions.getUsername();
    if (username == "") {
      return const LoginPage();
    } else {
      return const GameScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: "assets/images/unnamed.png",
      centered: true,
      duration: 3000,
      splashIconSize: 200,
      backgroundColor: Theme.of(context).primaryColor,
      nextScreen: nextScreen(),
    );
  }
}
