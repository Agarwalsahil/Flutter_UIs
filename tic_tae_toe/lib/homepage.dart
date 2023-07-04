import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool turnoh = true;
  List<String> displayxo = ['', '', '', '', '', '', '', '', ''];
  var mTextStyle = const TextStyle(color: Colors.white, fontSize: 1);
  int exScore = 0, ohScore = 0, filledBox = 0;

  // ignore: unused_field
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Player X', style: myNewFontWhite),
                    const SizedBox(height: 20),
                    Text(exScore.toString(), style: myNewFontWhite),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Player O', style: myNewFontWhite),
                    const SizedBox(height: 20),
                    Text(ohScore.toString(), style: myNewFontWhite),
                  ],
                ),
              ),
            ],
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (3)),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _ontapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center(
                        child: Text(
                      displayxo[index],
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'TIC TAC TOE',
                  style: myNewFontWhite,
                ),
                const SizedBox(height: 60),
                Text(
                  '@CREATEDBYSAHIL',
                  style: myNewFontWhite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _ontapped(int index) {
    setState(
      () {
        if (turnoh && displayxo[index] == '') {
          displayxo[index] = 'O';
          filledBox += 1;
        } else if (!turnoh && displayxo[index] == '') {
          displayxo[index] = 'X';
          filledBox += 1;
        }
        turnoh = !turnoh;
        _checkWinner();
      },
    );
  }

  void _checkWinner() {
    //check 1st row
    if (displayxo[0] == displayxo[1] &&
        displayxo[0] == displayxo[2] &&
        displayxo[0] != '') {
      _showWinDialogueBox(displayxo[0]);
    }

    //check 2nd row
    if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != '') {
      _showWinDialogueBox(displayxo[3]);
    }

    //check 3rd row
    if (displayxo[6] == displayxo[7] &&
        displayxo[6] == displayxo[8] &&
        displayxo[6] != '') {
      _showWinDialogueBox(displayxo[6]);
    }

    //check 1st column
    if (displayxo[0] == displayxo[3] &&
        displayxo[0] == displayxo[6] &&
        displayxo[0] != '') {
      _showWinDialogueBox(displayxo[0]);
    }

    //check 2nd column
    if (displayxo[1] == displayxo[4] &&
        displayxo[1] == displayxo[7] &&
        displayxo[1] != '') {
      _showWinDialogueBox(displayxo[1]);
    }

    //check 3rd column
    if (displayxo[2] == displayxo[5] &&
        displayxo[2] == displayxo[8] &&
        displayxo[2] != '') {
      _showWinDialogueBox(displayxo[2]);
    }

    //check main diagonal
    if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != '') {
      _showWinDialogueBox(displayxo[0]);
    }

    //check cross diagonal
    if (displayxo[2] == displayxo[4] &&
        displayxo[2] == displayxo[6] &&
        displayxo[2] != '') {
      _showWinDialogueBox(displayxo[2]);
    } else if (filledBox == 9) {
      _showDrawDialogueBox();
    }
  }

  void _showDrawDialogueBox() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Match Drawn!!"),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Play Again!',
              ),
            )
          ],
        );
      },
    );
  }

  void _showWinDialogueBox(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Winner is: $winner"),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Play Again!',
              ),
            )
          ],
        );
      },
    );
    if (winner == 'O') {
      ohScore += 1;
    } else if (winner == 'X') {
      exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayxo[i] = '';
      }
    });
    filledBox = 0;
  }
}
