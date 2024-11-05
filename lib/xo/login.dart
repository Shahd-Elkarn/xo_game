import 'package:flutter/material.dart';

import 'players_model.dart';
import 'xo_game.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String player1 = '';
    TextEditingController player2 = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Login",
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 30, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                player1 = value;
              },
              decoration: InputDecoration(
                hintText: "Player one",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: player2,
              decoration: InputDecoration(
                hintText: "Player Two",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  if (player1.isNotEmpty && player2.text.isNotEmpty) {
                    print("Navigating to XoGameScreen...");
                    Navigator.pushNamed(
                      context,
                      XoGameScreen.routeName,
                      arguments:
                          PlayersModel(player1: player1, player2: player2.text),
                    );
                  } else {
                    // Show an alert or error message if players' names are missing
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Please enter names for both players")),
                    );
                  }
                },
                child: Text(
                  "Play",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
