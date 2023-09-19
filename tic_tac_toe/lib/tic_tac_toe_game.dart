enum TicTacToeMark { x, o, none }

enum TicTacToeState { xTurn, oTurn, xWon, oWon, tie }

class TicTacToeGame {
  var board = List<TicTacToeMark>.filled(9, TicTacToeMark.none);
  var state = TicTacToeState.xTurn;

  String get stateString => state.toString().split(".").last;

  String get boardString {
    var bString = "";
    for (final mark in board) {
      // if (mark == TicTacToeMark.x) {
      //   bString += "X";
      // } else if (mark == TicTacToeMark.o) {
      //   bString += "O";
      // } else {
      //   bString += "-";
      // }
      bString += (mark == TicTacToeMark.x)
          ? "X"
          : ((mark == TicTacToeMark.o) ? "O" : "-");
    }
    return bString;
  }

  void pressedSquare(int index) {
    // Check the index to be sure it it 0 to 8.
    if (index < 0 || index > 8) {
      return; // Do nothing.
    }
    // Check if the board square is empty (return silent and do nothing if true)
    if (board[index] != TicTacToeMark.none) {
      return; // Do nothing.
    }
    if (state == TicTacToeState.xTurn) {
      board[index] = TicTacToeMark.x;
      state = TicTacToeState.oTurn;
      _checkForWin();
    } else if (state == TicTacToeState.oTurn) {
      board[index] = TicTacToeMark.o;
      state = TicTacToeState.xTurn;
      _checkForWin();
    }
  }

  void _checkForWin() {
    // Check for a tie.
    if (!board.contains(TicTacToeMark.none)) {
      state = TicTacToeState.tie;
    }
    final bString = boardString;
    final linesOf3 = <String>[];
    linesOf3.add(bString[0] + bString[1] + bString[2]);
    linesOf3.add(bString[3] + bString[4] + bString[5]);
    linesOf3.add(bString[6] + bString[7] + bString[8]);

    linesOf3.add(bString[0] + bString[3] + bString[6]);
    linesOf3.add(bString[1] + bString[4] + bString[7]);
    linesOf3.add(bString[2] + bString[5] + bString[8]);

    linesOf3.add(bString[0] + bString[4] + bString[8]);
    linesOf3.add(bString[2] + bString[4] + bString[6]);
    for (final lineOf3 in linesOf3) {
      if (lineOf3 == "XXX") {
        state = TicTacToeState.xWon;
      }
      if (lineOf3 == "OOO") {
        state = TicTacToeState.oWon;
      }
    }
  }

  @override
  String toString() {
    return "$stateString $boardString";
  }
}
