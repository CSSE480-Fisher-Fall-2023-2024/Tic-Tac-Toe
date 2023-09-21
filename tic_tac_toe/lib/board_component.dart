import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tic_tac_toe_game.dart';

class Board extends StatelessWidget {
  final TicTacToeGame game;
  final void Function(int) pressedSquare;

  const Board({
    super.key,
    required this.game,
    required this.pressedSquare,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    for (var k = 0; k < 9; k++) {
      var filename = "assets/images/blank.png";
      if (game.board[k] == TicTacToeMark.x) {
        filename = "assets/images/x.png";
      } else if (game.board[k] == TicTacToeMark.o) {
        filename = "assets/images/o.png";
      }
      var newButton = InkWell(
        onTap: () {
          pressedSquare(k);
        },
        child: Image.asset(filename),
      );
      buttons.add(newButton);
    }
    return Expanded(
      child: Stack(
        children: [
          Image.asset("assets/images/board.png"),
          GridView.count(
            crossAxisCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 30.0,
            children: buttons,
          ),
        ],
      ),
    );
  }
}
