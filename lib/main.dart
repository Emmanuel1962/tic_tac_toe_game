import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/Screen/game.dart';
import 'package:tic_tac_toe_game/Screen/login.dart';
import 'package:tic_tac_toe_game/Screen/splashscreen.dart';
import 'package:tic_tac_toe_game/helper/helper_fuction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await nextScreen();
  await HelperFuctions.init();

  runApp(const MyApp());
}

// nextScreen() {
//   final username = HelperFuctions.getUsername();
//   if (username == "") {
//     return const GameScreen();
//   } else {
//     return const LoginPage();
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
