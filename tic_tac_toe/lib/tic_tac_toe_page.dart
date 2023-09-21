import 'package:flutter/material.dart';
import 'package:tic_tac_toe/board_component.dart';
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
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Text(
                  getStateString(),
                  // style: TextStyle(fontSize: 40.0),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Board(
                game: game,
                pressedSquare: (index) {
                  setState(() {
                    game.pressedSquare(index);
                  });
                },
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                alignment: Alignment.topRight,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        game = TicTacToeGame();
                      });
                    },
                    child: const Text(
                      "New Game",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color.fromRGBO(128, 0, 0, 1.0),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
