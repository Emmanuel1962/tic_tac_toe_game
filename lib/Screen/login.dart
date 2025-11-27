// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/Constant/colours.dart';
import 'package:tic_tac_toe_game/Screen/game.dart';
import 'package:tic_tac_toe_game/Screen/homepage.dart';
import 'package:tic_tac_toe_game/helper/helper_fuction.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool value = false;

  TextEditingController nameCtrl = TextEditingController();
  String name = "";
  bool isLoading = false;
  @override
  void initState() {
    name = HelperFuctions.setusername('Username').toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "WELCOME TO THE TIC TAC TOE GAME !",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Login And Get Started",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: nameCtrl,
                        decoration: InputDecoration(
                          label: const Text(
                            'Username',
                            style: TextStyle(color: Colors.white),
                          ),
                          hintText: "Enter Your Username ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          // filled: true,
                          // fillColor: Colors.grey,
                        ),
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Fill In Your Username";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          login();
                        },
                        minWidth: 100,
                        color: Theme.of(context).primaryColor,
                        shape: const StadiumBorder(),
                        child: const Text(
                          "NEXT",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  login() async {
    setState(() {
      isLoading = true;
    });

    if (formkey.currentState!.validate()) {
      await HelperFuctions.setusername(nameCtrl.text);
      var route = MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
      Navigator.pushAndRemoveUntil(context, route, (route) => false);
    } else {
      showSnackbar(context, "Enter your username", Colors.red);
    }
  }

  void showSnackbar(context, message, color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
          textColor: Colors.white,
        ),
      ),
    );
  }
}
