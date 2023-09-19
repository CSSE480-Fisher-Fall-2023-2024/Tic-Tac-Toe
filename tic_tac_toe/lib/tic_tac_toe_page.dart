import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tic_tac_toe_game.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key});

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  var game = TicTacToeGame();

  String getStateString() {
    var sString = "";
    if (game.state == TicTacToeState.xTurn) {
      sString = "X's Turn";
    } else if (game.state == TicTacToeState.oTurn) {
      sString = "O's Turn";
    } else if (game.state == TicTacToeState.xWon) {
      sString = "X Wins!";
    } else if (game.state == TicTacToeState.oWon) {
      sString = "O Wins!";
    } else if (game.state == TicTacToeState.tie) {
      sString = "Tie Game";
    }
    return sString;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    for (var k = 0; k < 9; k++) {
      var newButton = Image.asset("assets/images/x.png");
      buttons.add(newButton);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic-Tac-Toe"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          // width: 300.0,
          constraints: const BoxConstraints(maxWidth: 500.0),
          child: Column(
            children: [
              Text(
                getStateString(),
                // style: TextStyle(fontSize: 40.0),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Expanded(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
