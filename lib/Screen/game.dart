import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/Constant/colours.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static var customFontWhite = GoogleFonts.coiny(
    textStyle:
        const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 24),
  );
  bool oTurn = true;
  List<String> displayXO = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  String result = "";
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool winnerFound = false;
  int attempts = 0;
  List<int> matchedBoxes = [];
  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        // this is to reduce the time as it increases. Remember that seconds is assigned to maxseconds and maxseconds is =30
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
        }
      });
    });
  }

// this is to stop the timer
  stopTimer() {
    resetTimer();
    timer?.cancel();
  }

//this would take the timmer back to 30 seconds after running
  resetTimer() => seconds = maxSeconds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColour,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Player O",
                          style: customFontWhite,
                        ),
                        Text(
                          oScore.toString(),
                          style: customFontWhite,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Player X",
                          style: customFontWhite,
                        ),
                        Text(
                          xScore.toString(),
                          style: customFontWhite,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 5,
                            color: MainColor.primaryColour,
                          ),
                          color: matchedBoxes.contains(index)
                              ? MainColor.accesentColour
                              : MainColor.secondaryColour,
                        ),
                        // this for the letters inside the box
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: GoogleFonts.coiny(
                              textStyle: TextStyle(
                                fontSize: 64,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      result,
                      style: customFontWhite,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildTimer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  tapped(int index) {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      setState(() {
        if (oTurn && displayXO[index] == "") {
          displayXO[index] = "O";
          filledBoxes++;
        } else if (!oTurn && displayXO[index] == "") {
          displayXO[index] = "X";
          filledBoxes++;
        }
        oTurn = !oTurn;
        checkWinner();
      });
    }
  }

  checkWinner() {
    //it has 8 combination, 3 for column, 3 for row, 2 for diagonal
    // this 8 combinations is  beacuse the first integer is 0

    //checking 1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != "") {
      setState(() {
        result = "Player ${displayXO[0]} Wins";
        matchedBoxes.addAll([0, 1, 2]);
        stopTimer();
        updateScore(displayXO[0]);
      });
    }
    // checking 2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != "") {
      setState(() {
        result = "Player ${displayXO[3]} Wins";

        matchedBoxes.addAll([3, 4, 5]);
        stopTimer();
        updateScore(displayXO[3]);
      });
    }
    // checking 3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != "") {
      setState(() {
        result = "Player" + displayXO[6] + "Wins";
        matchedBoxes.addAll([6, 7, 8]);
        stopTimer();
        updateScore(displayXO[6]);
      });
    }
    //checking 1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != "") {
      setState(() {
        result = "Player" + displayXO[0] + "Wins";
        matchedBoxes.addAll([0, 3, 6]);
        stopTimer();
        updateScore(displayXO[0]);
      });
    }
    //checking 2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != "") {
      setState(() {
        result = "Player" + displayXO[1] + "Wins";
        matchedBoxes.addAll([1, 4, 7]);
        stopTimer();
        updateScore(displayXO[1]);
      });
    }
    //checking 3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != "") {
      setState(() {
        result = "Player" + displayXO[2] + "Wins";
        matchedBoxes.addAll([2, 5, 8]);
        stopTimer();
        updateScore(displayXO[2]);
      });
    }
    // checking 1st diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != "") {
      setState(() {
        result = "Player" + displayXO[0] + "Wins";
        matchedBoxes.addAll([0, 4, 8]);
        stopTimer();
        updateScore(displayXO[0]);
      });
    }
    // checking 2nd diagonal
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != "") {
      setState(() {
        result = "Player" + displayXO[2] + "Wins";
        matchedBoxes.addAll([2, 4, 6]);
        stopTimer();
        updateScore(displayXO[2]);
      });
    }
    if (winnerFound && filledBoxes == 9) {
      setState(() {
        result = "Nobody Wins!";
        stopTimer();
      });
    }
  }

  updateScore(String winner) {
    if (winner == "O") {
      oScore++;
    } else if (winner == "X") {
      xScore++;
    }
    winnerFound = true;
  }

  _clearBoard() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        displayXO[i] =
            ""; // this would clear the board. the i represents the boxes and its starts from 0
      }
      result = ""; // reseting the results
      filledBoxes = 0; // the filled boxes would now be empty
    });
  }

  Widget _buildTimer() {
    final isRunning = timer == null ? false : timer!.isActive;
    //this line above means that if the timmer is not running it's false but if it is, it's active!

    return isRunning
        ? SizedBox(
            height: 70,
            width: 70,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / maxSeconds,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 8,
                  backgroundColor: MainColor.primaryColour,
                ),
                Center(
                  child: Text(
                    '$seconds',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 35),
                  ),
                )
              ],
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
            onPressed: () {
              startTimer();
              _clearBoard();
              attempts++;
              matchedBoxes = [];
            },
            child: Text(
              attempts == 0 ? "Start" : "Play again",
              style: TextStyle(fontSize: 18),
            ));
  }
}
