import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/Constant/colours.dart';
import 'package:tic_tac_toe_game/Screen/game.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: MainColor.primaryColour,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var route =
              MaterialPageRoute(builder: (context) => const GameScreen());
          Navigator.push(context, route);
        },
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Text(
          "Continue",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
