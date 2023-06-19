import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:newprjj/home_screen.dart';

class GameScreen extends StatefulWidget {
 String Player1;
 String Player2;
 GameScreen({required this.Player1,required this.Player2});
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  late List<List<String>> _board;

  late String _currentPlayer;
  late String _winner;
  late bool _gameOver;

  @override
  void initState() {
    super.initState();
    _board = List.generate(3, (_) => List.generate(3, (_)=>""));
    _currentPlayer = "X";
    _winner = "";
    _gameOver = false;
  }

  //Reset game

  void _resetGame(){
    setState(() {
    _board = List.generate(3, (_) => List.generate(3, (_)=>""));
    _currentPlayer = "X";
    _winner = "";
    _gameOver = false;
    });
  }

  void _makeMove(int row, int col){
    if(_board[row][col]!= "" || _gameOver){
      return;
    }

    setState(() {
      _board[row][col] = _currentPlayer;
      //check for winner:

      if(_board[row][0] == _currentPlayer && _board[row][1]==_currentPlayer &&  _board[row][2]==_currentPlayer){
        _winner=_currentPlayer;
        _gameOver= true;
      }
      else if(_board[0][col] == _currentPlayer && _board[1][col]==_currentPlayer &&  _board[2][col]==_currentPlayer){
        _winner=_currentPlayer;
        _gameOver= true;
      }
      else if(_board[0][0] == _currentPlayer && _board[1][1]==_currentPlayer &&  _board[2][2]==_currentPlayer){
        _winner=_currentPlayer;
        _gameOver= true;
      }
      else if(_board[0][2] == _currentPlayer && _board[1][1]==_currentPlayer &&  _board[2][0]==_currentPlayer){
        _winner=_currentPlayer;
        _gameOver= true;
      }

      //switch player 2;

      _currentPlayer = _currentPlayer == "X" ? "O" : "X";

      //check for tie
      if(!_board.any((row) => row.any((cell) => cell == ""))){
      _gameOver = true;
      _winner = "It's a Tie";
      }
      if(_winner != ""){
        AwesomeDialog(context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        btnOkText: "Play Again",
        title: _winner=="X" ? widget.Player1 + "Won !!":_winner == "O" ? widget.Player2+"Won !!" : "It's Tie",
        btnOkOnPress: () {
          _resetGame();
        },
        )..show();
      }
     
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF323D5B),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70,),
            SizedBox(
              height: 120,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Turn: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                      Text(
                        _currentPlayer == "X" ? widget.Player1 + " ($_currentPlayer)": widget.Player2 + "($_currentPlayer)",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _currentPlayer == "X"? Color(0xFFE25041) : Color(0xFF1CBD9E),
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF5F6884),
              ),
              margin: EdgeInsets.all(15),
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
                itemBuilder: (context, index) {
                  int row = index ~/3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () => _makeMove(row, col),
                    child: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color(0xFF0E1E3A),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Center(
                        child: Text(_board[row][col],
                        style: TextStyle(
                          fontSize: 120,
                          fontWeight: FontWeight.bold,
                          color: _board[row][col]=="X"? Color(0xFFE25041):Color(0xFFECBD9E),

                        ),),
                      ),


                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: _resetGame,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 18 , horizontal: 30),
                    child: Text(
                      "Reset Game",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),

                  ),
                ),

                InkWell(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),
                    ),
                    );
                    widget.Player1 = "";
                    widget.Player2 = "";


                  }
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 18 , horizontal: 30),
                    child: Text(
                      "Restart Game",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),

                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}