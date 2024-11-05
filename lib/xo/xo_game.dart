import 'package:flutter/material.dart';

import 'elev_bun.dart';
import 'players_model.dart';

class XoGameScreen extends StatefulWidget {
  static const String routeName = 'XoGame';
  XoGameScreen({super.key});

  @override
  State<XoGameScreen> createState() => _XoGameScreenState();
}

class _XoGameScreenState extends State<XoGameScreen> {
  List<String> boardState = [
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
  int counter = 1;
  int score1 = 0;
  int score2 = 0;

  @override
  Widget build(BuildContext context) {
    PlayersModel model =
        ModalRoute.of(context)!.settings.arguments as PlayersModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "XO Game",
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 30, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      model.player1,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "$score1",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      model.player2,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "$score2",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevBun(label: boardState[0], onClick: onBoardClick, index: 0),
                ElevBun(label: boardState[1], onClick: onBoardClick, index: 1),
                ElevBun(label: boardState[2], onClick: onBoardClick, index: 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevBun(
                  label: boardState[3],
                  onClick: onBoardClick,
                  index: 3,
                ),
                ElevBun(
                  label: boardState[4],
                  onClick: onBoardClick,
                  index: 4,
                ),
                ElevBun(
                  label: boardState[5],
                  onClick: onBoardClick,
                  index: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevBun(
                  label: boardState[6],
                  onClick: onBoardClick,
                  index: 6,
                ),
                ElevBun(
                  label: boardState[7],
                  onClick: onBoardClick,
                  index: 7,
                ),
                ElevBun(
                  label: boardState[8],
                  onClick: onBoardClick,
                  index: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onBoardClick(index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter.isOdd) {
      boardState[index] = 'x';
      score1 += 2;
      bool win = checkWin("x");
      if (win) {
        score1 += 10;
        resetBoard();
      }
    } else {
      boardState[index] = 'o';
      score2 += 2;
      bool win = checkWin("o");
      if (win) {
        score2 += 10;
        resetBoard();
      }
    }
    counter++;
    if (counter == 10) {
      resetBoard();
    }
    setState(() {});
  }

  resetBoard() {
    boardState = [
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
    counter = 1;
  }

  bool checkWin(String symbol) {
    // check row
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }

    //check column
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    //check diagonal
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }
}
