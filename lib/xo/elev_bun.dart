import 'package:flutter/material.dart';

import 'players_model.dart';
import 'xo_game.dart';

class ElevBun extends StatelessWidget {
  String label;
  Function onClick; // Updated the function name
  int index;
  ElevBun({
    super.key,
    required this.label,
    required this.onClick, // Updated here
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade200,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: () {
          onClick(index); // Updated here
        },
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 60, color: Colors.white, fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}
