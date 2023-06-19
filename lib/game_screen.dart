import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
 String Player1;
 String Player2;
 GameScreen({required this.Player1,required this.Player2});
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}